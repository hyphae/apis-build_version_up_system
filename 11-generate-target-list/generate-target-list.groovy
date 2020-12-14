
// -auxAddress ${AUX_ADDRESS} -auxUsername ${AUX_USERNAME} -auxPassword ${AUX_PASSWORD} -auxRootPassword ${AUX_ROOT_PASSWORD} -copUsername ${COP_USERNAME} -copPassword ${COP_PASSWORD} -copRootPassword ${COP_ROOT_PASSWORD} -copXml ${copXml} -out ${out}

def auxAddress = ''
def copXml = ''
args.eachWithIndex { item, index ->
	if (item == '-auxAddress') {
		auxAddress = args[index + 1]
	} else if (item == '-auxUsername') {
		auxUsername = args[index + 1]
	} else if (item == '-auxPassword') {
		auxPassword = args[index + 1]
	} else if (item == '-auxRootPassword') {
		auxRootPassword = args[index + 1]
	} else if (item == '-copUsername') {
		copUsername = args[index + 1]
	} else if (item == '-copPassword') {
		copPassword = args[index + 1]
	} else if (item == '-copRootPassword') {
		copRootPassword = args[index + 1]
	} else if (item == '-copXml') {
		copXml = args[index + 1]
	} else if (item == '-out') {
		out = args[index + 1]
	}
}
println 'auxAddress : ' + auxAddress
println 'auxUsername : ' + auxUsername
println 'auxPassword : ' + auxPassword
println 'auxRootPassword : ' + auxRootPassword
println 'copUsername : ' + copUsername
println 'copPassword : ' + copPassword
println 'copRootPassword : ' + copRootPassword
println 'copXml : ' + copXml
println 'out : ' + out

new File(out).withWriter('UTF-8') { writer ->

	writer << 'AUX,' + auxAddress + ',,' + auxUsername + ',' + auxPassword + ',' + auxRootPassword + "\n"

	def copXmlFile = new File(copXml)
	def community = new XmlSlurper().parse(copXmlFile)

	def firstCop = community.firstCop
	if (auxAddress == firstCop.hostName.text()) {
		println 'AUX == FIRST COP'
		writer << 'FIRST,' + firstCop.hostName + ',,' + copUsername + ',' + copPassword + ',' + auxRootPassword + "\n"
	} else {
		println 'AUX != FIRST COP'
		writer << 'FIRST,' + firstCop.hostName + ',FIRST,' + copUsername + ',' + copPassword + ',' + copRootPassword + "\n"
	}

	community.copList.cop.each {
		writer << 'COP,' + it.hostName + ',' + it.unitId + ',' + copUsername + ',' + copPassword + ',' + copRootPassword + "\n"
	}

}
