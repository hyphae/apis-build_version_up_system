# apis-build_version_up_system

## Introduction
The apis-build_version_up_system clones all of the software needed to build the APIS evaluation environment from GitHub/Sony CSL in a single batch, builds the software, generates the various configuration files required for APIS operation according to the configuration file, and then installs all of the software on multiple nodes. This software facilitates construction of a multi-node APIS evaluation environment. The default environment comprises a node on which apis-emulator node runs (IoT Board ZERO), a node on which apis-main_controller and apis-web run (IoT Board FIRST), and nodes on which apis-main and apis-dcdc_batt_comm run (IoT Boards (COP1 to COP4)), but the environment can be modified by editing the configuration file.  

![キャプチャ](https://user-images.githubusercontent.com/71874910/105286005-d3e5c580-5bf8-11eb-9cb2-73c57a14724e.PNG)

## Preparation  
git, maven, groovy, expect and JDK must be installed in advance.
Refer to the apis-build_version_up_system specifications for preparation of IoT Boards


## Installation
Here is how to use apis-build_version_up_system.  
Do not include any non-English characters in the path of the folder where you will download the source code by git clone.

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
