import java.io.PrintWriter

import scala.language.postfixOps
import scala.util.Try
import scala.xml._

object CopInfoTransformer extends App {

  if (args.length != 4) {
    System.err.println("Usage: CopInfoTransformer <copXmlFileName> <programKey> <version> <enableEncryption>")
    System.exit(1)
  } else {
    val copXmlFileName = args(0)
    val programKey = args(1)
    val version = args(2)
    val enableEncryption = Try(args(3).toBoolean).getOrElse(false)

    // load cop.xml
    val community = XML.loadFile(copXmlFileName)
    val firstCop = community \ "firstCop" head

    // create encryptor object
    val CIPHER_TRANSFORMATION = "AES/CBC/PKCS5Padding"
    val CIPHER_KEY_SIZE = 128
    val CIPHER_KEY_ALGORITHM = "AES"
    val HASH_ALGORITHM = "MD5"
    val cipher = javax.crypto.Cipher.getInstance(CIPHER_TRANSFORMATION)
    val hash = java.security.MessageDigest.getInstance(HASH_ALGORITHM)
    val seed = (community \ "communityId").text + '-' + (community \ "cluster" \ "clusterId").text + '-' + version
    var md = hash.digest(seed.getBytes(java.nio.charset.StandardCharsets.UTF_8))
    var bytes = new Array[Byte](CIPHER_KEY_SIZE / 8)
    System.arraycopy(md, 0, bytes, 0, bytes.length)
    val key = new javax.crypto.spec.SecretKeySpec(bytes, CIPHER_KEY_ALGORITHM)
    md = hash.digest(hash.digest(seed.getBytes(java.nio.charset.StandardCharsets.UTF_8)))
    bytes = new Array[Byte](cipher.getBlockSize)
    System.arraycopy(md, 0, bytes, 0, bytes.length)
    val iv = new javax.crypto.spec.IvParameterSpec(bytes)
    val encryptor = new java.text.Format() {
      @Override def format(obj: Object, toAppendTo: java.lang.StringBuffer, pos: java.text.FieldPosition): java.lang.StringBuffer = {
        if (obj != null) {
          toAppendTo.append(encrypt_(obj))
        }
        toAppendTo
      }
      @Override def parseObject(source: String, pos: java.text.ParsePosition): Object = {
        throw new IllegalStateException("source : " + source)
      }
      def encrypt_(obj: Object): String = {
        cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, key, iv)
        val bytes = cipher.doFinal(obj.toString.getBytes(java.nio.charset.StandardCharsets.UTF_8))
        java.util.Base64.getEncoder().encodeToString(bytes)
      }
    }

    //
    // apis-ccc
    //
    if (programKey == "ccc") {
      val cccLoggingProperties = new PrintWriter("ccc-logging.properties")
      cccLoggingProperties.write(apis_ccc.txt.logging(community).toString.trim)
      cccLoggingProperties.close()

      if (enableEncryption) {
        val cccClusterXml = new PrintWriter("ccc-cluster.xml.encrypted")
        cccClusterXml.write(encryptor.format(common.xml.cluster(community, firstCop, version).toString.trim))
        cccClusterXml.close()
      } else {
        val cccClusterXml = new PrintWriter("ccc-cluster.xml")
        cccClusterXml.write(common.xml.cluster(community, firstCop, version).toString.trim)
        cccClusterXml.close()
      }

      val cccConfigJson = new PrintWriter("ccc-config.json")
      cccConfigJson.write(apis_ccc.txt.config(community, firstCop).toString.trim)
      cccConfigJson.close()

      val cccStartSh = new PrintWriter("ccc-start.sh")
      cccStartSh.write(apis_ccc.txt.start(community, firstCop, version).toString.trim)
      cccStartSh.close()
    }

    //
    // apis-log
    //
    if (programKey == "log") {
      val logLoggingProperties = new PrintWriter("log-logging.properties")
      logLoggingProperties.write(apis_log.txt.logging(community).toString.trim)
      logLoggingProperties.close()

      val logConfigJson = new PrintWriter("log-config.json")
      logConfigJson.write(apis_log.txt.config(community, firstCop).toString.trim)
      logConfigJson.close()

      val logStartSh = new PrintWriter("log-start.sh")
      logStartSh.write(apis_log.txt.start(community, firstCop, version).toString.trim)
      logStartSh.close()
    }

    //
    // apis-web
    //
    if (programKey == "web") {
      val webLoggingProperties = new PrintWriter("web-logging.properties")
      webLoggingProperties.write(apis_web.txt.logging(community).toString.trim)
      webLoggingProperties.close()

      if (enableEncryption) {
        val webClusterXml = new PrintWriter("web-cluster.xml.encrypted")
        webClusterXml.write(encryptor.format(common.xml.cluster(community, firstCop, version).toString.trim))
        webClusterXml.close()
      } else {
        val webClusterXml = new PrintWriter("web-cluster.xml")
        webClusterXml.write(common.xml.cluster(community, firstCop, version).toString.trim)
        webClusterXml.close()
      }

      val webConfigJson = new PrintWriter("web-config.json")
      webConfigJson.write(apis_web.txt.config(community, firstCop).toString.trim)
      webConfigJson.close()

      val webStartSh = new PrintWriter("web-start.sh")
      webStartSh.write(apis_web.txt.start(community, firstCop, version).toString.trim)
      webStartSh.close()
    }

    //
    // apis-main
    //
    if (programKey == "main") {
      val mainLoggingProperties = new PrintWriter("main-logging.properties")
      mainLoggingProperties.write(apis_main.txt.logging(community).toString.trim)
      mainLoggingProperties.close()

      val mainPolicyJson = new PrintWriter("main-policy.json")
      mainPolicyJson.write(apis_main.txt.policy(community).toString.trim)
      mainPolicyJson.close()

      (community \ "copList" \ "cop").foreach { cop: Node =>
        val unitId = (cop \ "unitId").text

        if (enableEncryption) {
          val mainClusterXml = new PrintWriter(s"$unitId.main-cluster.xml.encrypted")
          mainClusterXml.write(encryptor.format(common.xml.cluster(community, cop, version).toString.trim))
          mainClusterXml.close()
        } else {
          val mainClusterXml = new PrintWriter(s"$unitId.main-cluster.xml")
          mainClusterXml.write(common.xml.cluster(community, cop, version).toString.trim)
          mainClusterXml.close()
        }

        val mainConfigJson = new PrintWriter(s"$unitId.main-config.json")
        if (enableEncryption) {
          mainConfigJson.write(apis_main.txt.config(community, cop, encryptor).toString.trim)
        } else {
          mainConfigJson.write(apis_main.txt.config(community, cop, null).toString.trim)
        }
        mainConfigJson.close()

        val mainHwConfigJson = new PrintWriter(s"$unitId.main-hwConfig.json")
        mainHwConfigJson.write(apis_main.txt.hwConfig(cop).toString.trim)
        mainHwConfigJson.close()

        val mainScenarioJson = new PrintWriter(s"$unitId.main-scenario.json")
        mainScenarioJson.write(apis_main.txt.scenario(community, cop).toString.trim)
        mainScenarioJson.close()

        val mainStartSh = new PrintWriter(s"$unitId.main-start.sh")
        mainStartSh.write(apis_main.txt.start(community, cop, version).toString.trim)
        mainStartSh.close()
      }
    }
  }

}
