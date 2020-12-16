
// Check the number of command-line arguments
if (args.length < 6) {
	println 'Usage: groovy progress_info.groovy -t <target> -f <copXmlFileName> -cop "all"|"first"|<unitId>'
	System.exit(1)
}

// Command line arguments get
def target = ''
def copXmlFileName = ''
def cop = []
args.eachWithIndex { item, index ->
	if (item == '-t') {
		target = args[index + 1]
	} else if (item == '-f') {
		copXmlFileName = args[index + 1]
	} else if (item == '-cop') {
		cop = args[index + 1].split(',')
	}
}

def APIS_TOOL_NAMES = ['apis-web', 'apis-ccc', 'apis-log']
def APIS_UNIT_IDS = []
def DISABLED_ITEMS = []

// DEBUG START
println 'target = ' + target
println 'copXmlFileName = ' + copXmlFileName
println 'cop = ' + cop
// DEBUG END

// Read the COP information file
def copXmlFile = new File(copXmlFileName)
def community = new XmlSlurper().parse(copXmlFile)

community.copList.cop.unitId.each { APIS_UNIT_IDS.add(it.text()) }
community.disabledItems.disabledItem.each { DISABLED_ITEMS.add(it.text()) }

println '0 : cop.xml 中のユニット数および全 tool 数'
println '0 : number of units = ' + APIS_UNIT_IDS.size()
println '0 : number of tools = ' + APIS_TOOL_NAMES.size()

DISABLED_ITEMS.each {
	println it + ' is disabled'
	switch (it) {
		case 'apis-main':
			APIS_UNIT_IDS = []
			break
		default:
			if (APIS_TOOL_NAMES.contains(it)) {
				APIS_TOOL_NAMES.removeElement(it)
			} else {
				println 'ERROR : unknown disabledItem : ' + it
				System.exit(1)
			}
	}
}

println '1 : cop.xml 中の disabledItems を考慮した値'
println '1 : number of units = ' + APIS_UNIT_IDS.size()
println '1 : number of tools = ' + APIS_TOOL_NAMES.size()

def all_units = false
def all_tools = false
def specific_unit_ids = []
cop.each {
	println 'cop = ' + it
	switch (it) {
		case 'all':
			all_units = true
			all_tools = true
			break
		case 'first':
			all_tools = true
			break
		default:
			def unitId = it
			if (APIS_UNIT_IDS.contains(unitId)) {
				specific_unit_ids.add(unitId)
			} else {
				println 'ERROR : unknown unitId : ' + unitId
				System.exit(1)
			}
	}
}
if (!all_units) APIS_UNIT_IDS = (specific_unit_ids.size()) ? specific_unit_ids : []
if (!all_tools) APIS_TOOL_NAMES = []

println '2 : 起動時の cop 指定を考慮した値'
println '2 : number of units = ' + APIS_UNIT_IDS.size()
println '2 : number of tools = ' + APIS_TOOL_NAMES.size()

def progress_total = APIS_UNIT_IDS.size() + APIS_TOOL_NAMES.size()
switch (target) {
	case 'keycert':
		if (APIS_TOOL_NAMES.contains('apis-log')) {
			--progress_total
			println 'keycert : apis-log はクラスタに参加しないので不要 ( -1 )'
		}
		break
	case 'retrievelogs':
		println 'retrievelogs : zip の分を追加 ( +1 )'
		++progress_total
		break
	case 'suspend-all':
	case 'resume-all':
		println 'suspend-all/resume-all : Global Operation Mode を設定するだけなので 1'
		progress_total = 1
		break
	case 'unlock':
	case 'clearalarm':
		println 'unlock/clearalarm : tools は関係ない　ユニット数だけ'
		progress_total = APIS_UNIT_IDS.size()
}

println '##progress_total:' + progress_total

System.exit(0)

