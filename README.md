
![french doge](https://i.imgur.com/v2JIP3D.jpg)

***~~WOW SUCH DOGE~~***

> Doge NSP Updater alongside nut server brought to you by krptg

> Everything runs in Docker, no dependency needed (except Docker)

> Code will be always up to date with latest commits from doge and nut

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
Access the webui at ```http://<your IP>:6093``` and login as (defaults) :
* login: `doge`
* password : `DOGE`

---

#### Parameters 
+ ` -v $(pwd):/keys` *(Mandatory) - Uses current working directory to look for keys.txt*
+ ` -v /path/to/nsp:/nsp` *(Mandatory) - Location to your NSP folder. NSPs files must be at the root of this folder. Additional Files (Updates/DLCs/Demo/NSX) must be as follow (by default) :*
  + /nsp/base/* - NSPs files
  + /nsp/updates/* - NSPs update files
  + /nsp/dlc/* - NSPs DLC files
  + /nsp/nsx_base/* - NSXs files
  + /nsp/demo/* - NSPs demo files
---
#### ENV variables
+ `DOGE_USER=<user>` *(Optional) - Set Doge User : default to* `doge`
+ `DOGE_PASSWD=<password>` *(Optional) - Set Doge Password : default to* `DOGE`
+ `NUT_USER=<user>` *(Optional) - Set Nut User : default to* `AdMiN`
+ `NUT_PASSWD=<password>` *(Optional) - Set Nut Password : default to* `nYsTIaNICHIm`

---
#### Credits
+ wowsuchdoge : [doge](https://github.com/wowsuchdoge/doge)
+ blawar : [nut](https://github.com/blawar/nut)