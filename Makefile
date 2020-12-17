
prepare:
	11-prepare/main.sh
	12-generate-target-list/main.sh
	13-distribute-keys/main.sh

install:
	21-install-apis/main.sh
	22-install-dcdc_batt_comm/main.sh
	23-install-main_controller/main.sh
	24-install-emulator/main.sh

start:
	31-start/main.sh

stop:
	32-stop/main.sh

shutdown:
	91-shutdown/main.sh

clean:
	99-clean/main.sh
