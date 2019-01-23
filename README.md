
![french doge](https://i.imgur.com/v2JIP3D.jpg)

***~~WOW SUCH DOGE~~***

> Doge NSP Updated alongside nut server brought to you by krptg

> Everything runs in Docker, no dependency needed (except Docker)

> Code will be always up to date with latest commits from doge and nut

*Changelog is at the end of this README*

### **PSA : make sure to have a keys.txt ready and placed where you will run the `docker run` command**

#### Table of contents :

  * [Server in detached mode](#server-in-detached-mode)
  * [Server in detached mode with custom logins and passwords](#server-in-detached-mode-with-custom-logins-and-passwords)
  * [Check logs with (if in detached mode)](#check-logs-with--if-in-detached-mode-)
  * [Scrape CDN with a running container](#scrape-cdn-with-a-running-container)
  * [Using the application](#using-the-application)
  * [Parameters](#parameters)
  * [ENV variables](#env-variables)
  * [Credits](#credits)
  * [Changelog](#changelog)

---

#### Server in detached mode
>Remove -d to have it running in attached mode
```
docker run --name doge \ 
           -d \ 
           -v $(pwd):/keys
           -v /path/to/nsp:/nsp \ 
           -p 6093:6093 \
           krptg/doge
```
#### Server in detached mode with custom logins and passwords
```
docker run --name doge \ 
           -d \ 
           -v $(pwd):/keys
           -v /path/to/nsp:/nsp \ 
           -p 6093:6093 \ 
           -e DOGE_USER=admin \ 
           -e DOGE_PASSWD=admin \ 
           -e NUT_USER=admin \ 
           -e NUT_PASSWD=admin \ 
           krptg/doge
```
#### Check logs with (if in detached mode)
```docker logs doge```
#### Scrape CDN with a running container
```docker exec -it doge python3 /doge/nut/nut.py -s --scrape```
#### Using the application
Access the webui at ```http://<your IP>:6093``` and login as :
* login: `doge`
* password : `DOGE`

---

#### Parameters 
+ ` -v $(pwd):/keys` *(Mandatory) - Uses current working directory to look for keys.txt*
+ ` -v /path/to/nsp:/nsp` *(Mandatory) - Location to your NSP folder. NSPs files must be at the root of this folder. Additional Files (Updates/DLCs/Demo/NSX) must be as follow (by default, ENV can change it, see below) :*
  + /nsp/* - NSPs files
  + /nsp/Updates/* - NSPs update files
  + /nsp/DLC/* - NSPs DLC files
  + /nsp/NSX/* - NSXs files
  + /nsp/demos/* - NSPs demo files
---
#### ENV variables
+ `DOGE_USER=<user>` *(Optional) - Set Doge User : default to* `doge`
+ `DOGE_PASSWD=<password>` *(Optional) - Set Doge Password : default to* `DOGE`
+ `NUT_USER=<user>` *(Optional) - Set Nut User : default to* `AdMiN`
+ `NUT_PASSWD=<password>` *(Optional) - Set Nut Password : default to* `nYsTIaNICHIm`
+ `BASE_PATH=<path>` *(Optional) - Set path for BASE nsp files : default to* `/nsp`
+ `UPDATE_PATH=<path>` *(Optional) - Set path for UPDATE nsp files : default to* `/nsp/Updates`
+ `DLC_PATH=<path>` *(Optional) - Set path for DLC nsp files : default to* `/nsp/DLC`
+ `NSX_PATH=<path>` *(Optional) - Set path for NSX nsp files : default to* `/nsp/NSX`
+ `TITLEDB=<url>` *(Optional) - Set URL for nutdb : default to* `http://snip.li/nutdb`

*Exemple for custom paths*
- By default, NSP games are stored under /nsp/ and subfolders exist for Updates, DLC and NSX. The config file must take /nsp/ as its root folder for it to properly function. 
- If, for exemple, your UPDATE files are stored under a directory called `notUPDATES`, you'll have to setup the ENV UPDATE_PATH like this :
--  `UPDATE_PATH=notUPDATES/` (don't forget the trailing slash)

---
#### Credits
+ wowsuchdoge : [doge](https://github.com/wowsuchdoge/doge)
+ blawar : [nut](https://github.com/blawar/nut)
---
#### Changelog
+ **8** : Added support for custom paths, will need testing and tinkering in order to work 

+ **6** : Refactored Dockerfile

+ **4** : Removed built-in keys.txt, you must place keys.txt in a working directory

+ **3** : Now git clone instead of hard-copying doge and nut

+ **2** : Added ENV for custom user/passwd for nut and doge, see Usage

+ **1** : Made nut listen to 0.0.0.0 instead of 127.0.0.1

+ **initial_release** : Initial push with Doge 2.1.0
