
// -zeroAddress ${ZERO_ADDRESS} -zeroUsername ${ZERO_USERNAME} -zeroPassword ${ZERO_PASSWORD} -copPassword ${COP_PASSWORD} -copXml ${copXml} -out ${out}

def zeroAddress = ''
def copXml = ''
args.eachWithIndex { item, index ->
	if (item == '-zeroAddress') {
		zeroAddress = args[index + 1]
	} else if (item == '-zeroUsername') {
		zeroUsername = args[index + 1]
	} else if (item == '-zeroPassword') {
		zeroPassword = args[index + 1]
	} else if (item == '-copPassword') {
		copPassword = args[index + 1]
	} else if (item == '-copXml') {
		copXml = args[index + 1]
	} else if (item == '-out') {
		out = args[index + 1]
	}
}
println 'zeroAddress : ' + zeroAddress
println 'zeroUsername : ' + zeroUsername
println 'zeroPassword : ' + zeroPassword
println 'copPassword : ' + copPassword
println 'copXml : ' + copXml
println 'out : ' + out

new File(out).withWriter('UTF-8') { writer ->

	writer << 'ZERO,' + zeroAddress + ',' + zeroUsername + ',' + zeroPassword + "\n"

	def copXmlFile = new File(copXml)
	def community = new XmlSlurper().parse(copXmlFile)
	def firstCop = community.firstCop

	writer << 'FIRST,' + firstCop.hostName + ',' + firstCop.account + ',' + copPassword + "\n"

	community.copList.cop.each {
		writer << 'COP,' + it.hostName + ',' + it.account + ',' + copPassword + "\n"
	}

}
