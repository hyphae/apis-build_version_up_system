# apis-build_version_up_system

## Introduction
The apis-build_version_up_system clones all of the software needed to build the APIS evaluation environment from GitHub/Sony CSL in a single batch, builds the software, generates the various configuration files required for APIS operation according to the configuration file, and then installs all of the software on multiple nodes. This software facilitates construction of a multi-node APIS evaluation environment. The default environment comprises a node on which apis-emulator node runs (IoT Board ZERO), a node on which apis-main_controller and apis-web run (IoT Board FIRST), and nodes on which apis-main and apis-dcdc_batt_comm run (IoT Boards (COP1 to COP4)), but the environment can be modified by editing the configuration file.  

![キャプチャ](https://user-images.githubusercontent.com/71874910/105286005-d3e5c580-5bf8-11eb-9cb2-73c57a14724e.PNG)

## Preparation  


## Installation
git cloneを実施しソースコード一式をダウンロードするフォルダのパスに英語以外の文字を含まないこと。  

Here is how to install apis-build_version_up_system and clone all of the software needed to build the APIS evaluation environment to each IoT Board.  
git, maven, groovy, expect and JDK must be installed in advance.

```bash
$ git clone https://github.com/SonyCSL/apis-build_version_up_system.git
$ cd apis-build_version_up_system
$ make prepare
$ make install
```

## Running
Here is how to run APIS evaluation environment.  
```bash
$ cd apis-build_version_up_system
$ make start
```  

## Stopping
Here is how to stop APIS evaluation environment.  
```bash
$ cd apis-build_version_up_system
$ make stop
```  

<a id="anchor1"></a>
## Documentation



## License
&emsp;[Apache License Version 2.0](https://github.com/SonyCSL/apis-build_version_up_system/blob/main/LICENSE)


## Notice
&emsp;[Notice](https://github.com/SonyCSL/apis-build_version_up_system/blob/main/NOTICE.md)
