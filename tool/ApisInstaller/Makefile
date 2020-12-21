
EXP_VERSION=oss
tar=tar xzvf

# "all" | "first" | <unitId>
cop=all

logDir=.
workDir=.
version=x.y.z

confDir=../../conf
expDir=./exp

include ./make.conf


copXml=${confDir}/cop-${copCommunity}-${version}-${copVersion}.xml

apisTarGz=apis-${version}.tar.gz

apisMainTarGzSrc=${workDir}/apis-main/target/apis-main-${version}.tar.gz
apisWebTarGzSrc=${workDir}/apis-web/target/apis-web-${version}.tar.gz
apisCccTarGzSrc=${workDir}/apis-ccc/target/apis-ccc-${version}.tar.gz
apisLogTarGzSrc=${workDir}/apis-log/target/apis-log-${version}.tar.gz

apisMainTarGz=${workDir}/apis-main-${version}.tar.gz
apisWebTarGz=${workDir}/apis-web-${version}.tar.gz
apisCccTarGz=${workDir}/apis-ccc-${version}.tar.gz
apisLogTarGz=${workDir}/apis-log-${version}.tar.gz

copInfoTransformerTarGz=../CopInfoTransformer/target/CopInfoTransformer-${version}.tar.gz
copInfoTransformer=${workDir}/CopInfoTransformer-${version}

exp=${EXP_VERSION}.exp

stopExp=stop-${exp}
killExp=kill-${exp}
stopKillExp=stop-kill-${exp}
versionupExp=versionup-${exp}
setupfilesExp=setupfiles-${exp}
keycertExp=keycert-${exp}
verifyExp=verify-${exp}
startExp=start-${exp}
retrievelogsExp=retrievelogs-${exp}
operationmodeExp=operationmode-${exp}
clearalarmExp=clearalarm-${exp}

mainStopExp=${expDir}/main-${stopExp}
webStopExp=${expDir}/web-${stopExp}
cccStopExp=${expDir}/ccc-${stopExp}
logStopExp=${expDir}/log-${stopExp}
mainKillExp=${expDir}/main-${killExp}
webKillExp=${expDir}/web-${killExp}
cccKillExp=${expDir}/ccc-${killExp}
logKillExp=${expDir}/log-${killExp}
mainStopKillExp=${expDir}/main-${stopKillExp}
webStopKillExp=${expDir}/web-${stopKillExp}
cccStopKillExp=${expDir}/ccc-${stopKillExp}
logStopKillExp=${expDir}/log-${stopKillExp}
mainVersionupExp=${expDir}/main-${versionupExp}
webVersionupExp=${expDir}/web-${versionupExp}
cccVersionupExp=${expDir}/ccc-${versionupExp}
logVersionupExp=${expDir}/log-${versionupExp}
mainSetupfilesExp=${expDir}/main-${setupfilesExp}
webSetupfilesExp=${expDir}/web-${setupfilesExp}
cccSetupfilesExp=${expDir}/ccc-${setupfilesExp}
logSetupfilesExp=${expDir}/log-${setupfilesExp}
mainKeycertExp=${expDir}/main-${keycertExp}
webKeycertExp=${expDir}/web-${keycertExp}
cccKeycertExp=${expDir}/ccc-${keycertExp}
mainVerifyExp=${expDir}/main-${verifyExp}
webVerifyExp=${expDir}/web-${verifyExp}
cccVerifyExp=${expDir}/ccc-${verifyExp}
logVerifyExp=${expDir}/log-${verifyExp}
mainStartExp=${expDir}/main-${startExp}
webStartExp=${expDir}/web-${startExp}
cccStartExp=${expDir}/ccc-${startExp}
logStartExp=${expDir}/log-${startExp}
mainRetrievelogsExp=${expDir}/main-${retrievelogsExp}
webRetrievelogsExp=${expDir}/web-${retrievelogsExp}
cccRetrievelogsExp=${expDir}/ccc-${retrievelogsExp}
logRetrievelogsExp=${expDir}/log-${retrievelogsExp}
mainOperationmodeExp=${expDir}/main-${operationmodeExp}
deviceClearalarmExp=${expDir}/device-${clearalarmExp}


${copXml}:
	@echo ERROR : file not found : $(@) && exit 1

${apisTarGz}: ${apisMainTarGz} ${apisWebTarGz} ${apisCccTarGz} ${apisLogTarGz}

${workDir}/apis-bom:
	cd ${workDir} && git clone ${gitBaseUrl}/apis-bom
${workDir}/apis-common:
	cd ${workDir} && git clone ${gitBaseUrl}/apis-common

${workDir}/apis-main:
	cd ${workDir} && git clone ${gitBaseUrl}/apis-main
${workDir}/apis-web:
	cd ${workDir} && git clone ${gitBaseUrl}/apis-web
${workDir}/apis-ccc:
	cd ${workDir} && git clone ${gitBaseUrl}/apis-ccc
${workDir}/apis-log:
	cd ${workDir} && git clone ${gitBaseUrl}/apis-log

apisBom: ${workDir}/apis-bom
	cd ${workDir}/apis-bom && make clean install
apisCommon: ${workDir}/apis-common
	cd ${workDir}/apis-common && make clean install

${apisMainTarGzSrc}: ${workDir}/apis-main
	cd ${workDir}/apis-main && make clean package
${apisWebTarGzSrc}: ${workDir}/apis-web
	cd ${workDir}/apis-web && make clean package
${apisCccTarGzSrc}: ${workDir}/apis-ccc
	cd ${workDir}/apis-ccc && make clean package
${apisLogTarGzSrc}: ${workDir}/apis-log
	cd ${workDir}/apis-log && make clean package

${apisMainTarGz}: ${apisMainTarGzSrc}
	cp -p ${apisMainTarGzSrc} ${apisMainTarGz}
${apisWebTarGz}: ${apisWebTarGzSrc}
	cp -p ${apisWebTarGzSrc} ${apisWebTarGz}
${apisCccTarGz}: ${apisCccTarGzSrc}
	cp -p ${apisCccTarGzSrc} ${apisCccTarGz}
${apisLogTarGz}: ${apisLogTarGzSrc}
	cp -p ${apisLogTarGzSrc} ${apisLogTarGz}

${copInfoTransformerTarGz}:
	cd ../CopInfoTransformer && make clean package
${copInfoTransformer}: ${copInfoTransformerTarGz}
	cat ${copInfoTransformerTarGz} | ( cd ${workDir} && ${tar} - )

${exp}: ${stopExp} ${killExp} ${stopKillExp} ${versionupExp} ${setupfilesExp} ${keycertExp} ${verifyExp} ${startExp} ${retrievelogsExp} ${clearalarmExp}

${stopExp}: ${mainStopExp} ${webStopExp} ${cccStopExp} ${logStopExp}
${killExp}: ${mainKillExp} ${webKillExp} ${cccKillExp} ${logKillExp}
${stopKillExp}: ${mainStopKillExp} ${webStopKillExp} ${cccStopKillExp} ${logStopKillExp}
${versionupExp}: ${mainVersionupExp} ${webVersionupExp} ${cccVersionupExp} ${logVersionupExp}
${setupfilesExp}: ${mainSetupfilesExp} ${webSetupfilesExp} ${cccSetupfilesExp} ${logSetupfilesExp}
${keycertExp}: ${mainKeycertExp} ${webKeycertExp} ${cccKeycertExp}
${verifyExp}: ${mainVerifyExp} ${webVerifyExp} ${cccVerifyExp} ${logVerifyExp}
${startExp}: ${mainStartExp} ${webStartExp} ${cccStartExp} ${logStartExp}
${retrievelogsExp}: ${mainRetrievelogsExp} ${webRetrievelogsExp} ${cccRetrievelogsExp} ${logRetrievelogsExp}
${operationmodeExp}: ${mainOperationmodeExp}
${clearalarmExp}: ${deviceClearalarmExp}

${mainStopExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webStopExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccStopExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logStopExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainStopKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webStopKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccStopKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logStopKillExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainVersionupExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webVersionupExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccVersionupExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logVersionupExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainSetupfilesExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webSetupfilesExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccSetupfilesExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logSetupfilesExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainKeycertExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webKeycertExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccKeycertExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainVerifyExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webVerifyExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccVerifyExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logVerifyExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainStartExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webStartExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccStartExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logStartExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainRetrievelogsExp}:
	@echo ERROR : file not found : $(@) && exit 1
${webRetrievelogsExp}:
	@echo ERROR : file not found : $(@) && exit 1
${cccRetrievelogsExp}:
	@echo ERROR : file not found : $(@) && exit 1
${logRetrievelogsExp}:
	@echo ERROR : file not found : $(@) && exit 1
${mainOperationmodeExp}:
	@echo ERROR : file not found : $(@) && exit 1
${deviceClearalarmExp}:
	@echo ERROR : file not found : $(@) && exit 1

ensuredirs:
	mkdir -p ${logDir}
	mkdir -p ${workDir}


all: clean stop-kill versionup setupfiles keycert verify start

prepare: ensuredirs ${copXml} ${exp} apisBom apisCommon ${apisMainTarGzSrc} ${apisWebTarGzSrc} ${apisCccTarGzSrc} ${apisLogTarGzSrc} ${copInfoTransformerTarGz}


stop: ensuredirs ${copXml} ${stopExp}
	groovy progress_info.groovy -t stop                                                                            -f ${copXml} -cop ${cop}
	groovy  main-default.groovy        -e ${mainStopExp} -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a web -e ${webStopExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a ccc -e ${cccStopExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a log -e ${logStopExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}

kill: ensuredirs ${copXml} ${killExp}
	groovy progress_info.groovy -t kill                                                                            -f ${copXml} -cop ${cop}
	groovy  main-default.groovy        -e ${mainKillExp} -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a web -e ${webKillExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a ccc -e ${cccKillExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a log -e ${logKillExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}

stop-kill: ensuredirs ${copXml} ${stopKillExp}
	groovy progress_info.groovy -t stop-kill                                                                           -f ${copXml} -cop ${cop}
	groovy  main-default.groovy        -e ${mainStopKillExp} -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a web -e ${webStopKillExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a ccc -e ${cccStopKillExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a log -e ${logStopKillExp}  -c 100 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}

versionup: ensuredirs ${copXml} ${versionupExp} ${apisTarGz}
	groovy progress_info.groovy -t versionup                                                                            -f ${copXml} -cop ${cop}
	groovy  main-default.groovy        -e ${mainVersionupExp} -c 200 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a web -e ${webVersionupExp}  -c 200 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a ccc -e ${cccVersionupExp}  -c 200 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a log -e ${logVersionupExp}  -c 200 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}

setupfiles: ensuredirs ${copXml} ${setupfilesExp} ${copInfoTransformer}
	groovy    progress_info.groovy -t setupfiles                                                                            -f ${copXml} -cop ${cop}
	groovy  main-setupfiles.groovy        -e ${mainSetupfilesExp} -c 300 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-setupfiles.groovy -a web -e ${webSetupfilesExp}  -c 300 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-setupfiles.groovy -a ccc -e ${cccSetupfilesExp}  -c 300 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-setupfiles.groovy -a log -e ${logSetupfilesExp}  -c 300 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}

keycert: ensuredirs ${copXml} ${keycertExp}
	groovy progress_info.groovy -t keycert                                                                            -f ${copXml} -cop ${cop}
	groovy  main-keycert.groovy        -e ${mainKeycertExp} -c 400 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir}
	groovy tools-keycert.groovy -a web -e ${webKeycertExp}  -c 400 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir}
	groovy tools-keycert.groovy -a ccc -e ${cccKeycertExp}  -c 400 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir}

verify: ensuredirs ${copXml} ${verifyExp}
	groovy progress_info.groovy -t verify                                                                            -f ${copXml} -cop ${cop}
	groovy  main-default.groovy        -e ${mainVerifyExp} -c 500 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a web -e ${webVerifyExp}  -c 500 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a ccc -e ${cccVerifyExp}  -c 500 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a log -e ${logVerifyExp}  -c 500 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}

start: ensuredirs ${copXml} ${startExp}
	groovy progress_info.groovy -t start                                                                            -f ${copXml} -cop ${cop}
	groovy  main-default.groovy        -e ${mainStartExp} -c 600 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a web -e ${webStartExp}  -c 600 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a ccc -e ${cccStartExp}  -c 600 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}
	groovy tools-default.groovy -a log -e ${logStartExp}  -c 600 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -wd ${workDir}

retrievelogs: ensuredirs ${copXml} ${retrievelogsExp}
	$(eval DESTINATION_PATH := ${workDir}/products/apis_logs-$(shell date +%Y%m%d%H%M%S))
	groovy      progress_info.groovy -t retrievelogs                                                                            -f ${copXml} -cop ${cop}
	groovy  main-retrievelogs.groovy        -e ${mainRetrievelogsExp} -c 800 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -dp ${DESTINATION_PATH}
	groovy tools-retrievelogs.groovy -a web -e ${webRetrievelogsExp}  -c 800 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -dp ${DESTINATION_PATH}
	groovy tools-retrievelogs.groovy -a ccc -e ${cccRetrievelogsExp}  -c 800 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -dp ${DESTINATION_PATH}
	groovy tools-retrievelogs.groovy -a log -e ${logRetrievelogsExp}  -c 800 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -dp ${DESTINATION_PATH}
	groovy zip.groovy -in ${DESTINATION_PATH} -out ${DESTINATION_PATH}.zip

suspend-all: ensuredirs ${copXml} ${mainOperationmodeExp}
	groovy            progress_info.groovy -t suspend-all                                                                       -f ${copXml} -cop ${cop}
	groovy main-globaloperationmode.groovy -e ${mainOperationmodeExp} -c 900 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -m stop
resume-all: ensuredirs ${copXml} ${mainOperationmodeExp}
	groovy            progress_info.groovy -t resume-all                                                                        -f ${copXml} -cop ${cop}
	groovy main-globaloperationmode.groovy -e ${mainOperationmodeExp} -c 900 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -m autonomous
unlock: ensuredirs ${copXml} ${mainOperationmodeExp}
	groovy           progress_info.groovy -t unlock                                                                            -f ${copXml} -cop ${cop}
	groovy main-localoperationmode.groovy -e ${mainOperationmodeExp} -c 900 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir} -m ''

clearalarm: ensuredirs ${copXml} ${deviceClearalarmExp}
	groovy  progress_info.groovy -t clearalarm                                                                       -f ${copXml} -cop ${cop}
	groovy device-default.groovy -e ${deviceClearalarmExp} -c 900 -sp ${sshPassphrase} -i ${interface} -v ${version} -f ${copXml} -cop ${cop} -ld ${logDir}


showLog:
	FILES=`ls ${logDir}/*.log`; for FILE in $$FILES; do echo "---- $$FILE ----"; cat $$FILE; done

cleanLog:
	rm -rf ${logDir}/*.log

cleanDerived:
	rm -rf ${apisMainTarGz} ${apisWebTarGz} ${apisCccTarGz} ${apisLogTarGz} ${copInfoTransformer} ${workDir}/*-cluster.xml ${workDir}/*-logging.properties ${workDir}/*-start.sh ${workDir}/*-stop.sh ${workDir}/*-kill.sh ${workDir}/*.json ${workDir}/*.encrypted ${workDir}/products ${workDir}/${version} ${workDir}/attachments

clean: cleanLog cleanDerived
	#rm -rf cop-*.xml *.exp *.tar.gz CopInfoTransformer-*
