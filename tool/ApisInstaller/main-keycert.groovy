
// Check the number of command-line arguments
if (args.length < 16) {
    println "Usage: groovy main-keycert.groovy -e <expFile> -c <count> -sp <sshPassphrase> -i <interface> -v <version> -f <copXmlFileName> -cop \"all\"|\"first\"|<unitId> -ld <logDir>"
    System.exit(1)
}

// Command line arguments get
def expFile = ""
def count = ""
def sshPassphrase = ""
def interface_ = ""
def version = ""
def copXmlFileName = ""
def cop = ""
def logDir = ""
args.eachWithIndex { item, index ->
    if (item == "-e") {
        expFile = args[index + 1]
    } else if (item == "-c") {
        count = new Integer(args[index + 1])
    } else if (item == "-sp") {
        sshPassphrase = args[index + 1]
    } else if (item == "-i") {
        interface_ = args[index + 1]
    } else if (item == "-v") {
        version = args[index + 1]
    } else if (item == "-f") {
        copXmlFileName = args[index + 1]
    } else if (item == "-cop") {
        cop = args[index + 1].split(',')
    } else if (item == "-ld") {
        logDir = args[index + 1]
    }
}

// DEBUG START
println "version = ${version}"
println "copXmlFileName = ${copXmlFileName}"
println "cop = ${cop}"
// DEBUG END

// Command
def bash = "bash"

// Read the COP information file
def copXmlFile = new File(copXmlFileName)
def community = new XmlSlurper().parse(copXmlFile)

if (community.disabledItems.disabledItem.any { it.text() == 'apis-main' }) {
	println 'apis-main is disabled'
	return
}

// Execute : main keycert
def countryName = community.cluster.security.cert.countryName
def stateOrProvinceName = community.cluster.security.cert.stateOrProvinceName
def localityName = community.cluster.security.cert.localityName
def organizationName = community.cluster.security.cert.organizationName
def organizationalUnitName = community.cluster.security.cert.organizationalUnitName
def commonName = community.cluster.security.cert.commonName
def emailAddress = community.cluster.security.cert.emailAddress
community.copList.cop.each {
    if (!cop.contains('all') && !cop.contains(it.unitId.text())) {
        return
    }

    // COP information
    def hostName = it.hostName
    def account = it.account
    def unitId = it.unitId

    // DEBUG START
    println "expFile = ${expFile}"
    println "sshPassphrase = ${sshPassphrase}"
    println "interface = ${interface_}"
    println "hostName = ${hostName}"
    println "account = ${account}"
    println "version = ${version}"
    println "unitId = ${unitId}"
    // DEBUG END

	println '##progress:' + unitId

    // Execute : main keycert
    def execCommand = [bash, expFile, sshPassphrase, interface_, hostName, account, version, countryName, stateOrProvinceName, localityName, organizationName, organizationalUnitName, commonName, emailAddress]

    // DEBUG START
    println "execCommand = " + execCommand
    // DEBUG END

    def sout = new StringBuilder(), serr = new StringBuilder()
    def proc = execCommand.execute()
    proc.consumeProcessOutput(sout, serr)
    def execResult = proc.waitFor()

    def countStr = String.format("%03d", ++count)
    def expFileBasename = new File(expFile).getName()
    new File("${logDir}/${countStr}-${unitId}-${expFileBasename}-out.log").text = sout
    new File("${logDir}/${countStr}-${unitId}-${expFileBasename}-err.log").text = serr

    // DEBUG START
    println "execResult = ${execResult}"
    // DEBUG END

    if (execResult != 0) {
        println "ERROR ${execResult} : ${execCommand}"
        System.exit(1)
    }
}

System.exit(0)

