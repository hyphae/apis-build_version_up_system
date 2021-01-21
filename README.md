# apis-build_version_up_system

## Introduction
The apis-build_version_up_system clones all of the software needed to build the APIS evaluation environment from GitHub/Sony CSL in a single batch, builds the software, generates the various configuration files required for APIS operation according to the configuration file, and then installs all of the software on multiple nodes. This software facilitates construction of a multi-node APIS evaluation environment. The default environment comprises a node on which apis-emulator node runs (IoT Board ZERO), a node on which apis-main_controller and apis-web run (IoT Board FIRST), and nodes on which apis-main and apis-dcdc_batt_comm run (IoT Boards (COP1 to COP4)), but the environment can be modified by editing the configuration file.  

(https://user-images.githubusercontent.com/71874910/105286005-d3e5c580-5bf8-11eb-9cb2-73c57a14724e.PNG)

## Installation
git cloneを実施しソースコード一式をダウンロードするフォルダのパスに英語以外の文字を含まないこと。

## Running


## Stopping

## Parameter Setting

<a id="anchor1"></a>
## Documentation



## License
&emsp;[Apache License Version 2.0](https://github.com/SonyCSL/apis-build_version_up_system/blob/main/LICENSE)


## Notice
&emsp;[Notice](https://github.com/SonyCSL/apis-build_version_up_system/blob/main/NOTICE.md)
