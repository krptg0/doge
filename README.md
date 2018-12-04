***WOW SUCH DOGE***

Doge NSP Updated alongside nut server brought to you by krptg

See changelog below for additionnal information

**VERY IMPORTANT : MAKE SURE YOU HAVE A KEYS.TXT FILE IN THE FOLDER YOU'RE RUNNING THE DOCKER RUN COMMAND, ELSE IT WILL FAIL**
---

## Usage
# Server in detached mode
Remove -d to have it running in attached mode
```
docker run --name doge \ 
           -d \ 
           -v $(pwd):/keys
           -v /path/to/nsp:/nsp \ 
           -p 6093:6093 \
           krptg/doge
```
# Server in detached mode with custom logins and passwords

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

# Check logs with (if in detached mode)

```docker logs doge```

# Scrape CDN with a running container

```docker exec -it doge python3 /doge/nut/nut.py -s --scrape```

---

## Parameters 
```The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container. So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080 http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.```


+ ` -v /path/to/nsp:/nsp` (Mandatory) - Location to your NSP folder. NSPs files must be at the root of this folder. Additional Files (Updates/DLCs/Demo/NSX) must be as follow :
++ * /nsp/* - NSPs files
++ * /nsp/Updates/* - NSPs update files
++ * /nsp/DLC/* - NSPs DLC files
++ * /nsp/NSX/* - NSXs files
++ * /nsp/demos/* - NSPs demo files

+ `-v /path/to/doge:/doge` (Optional) - Use it if you want local mount point for the whole doge folder (for config edition)
+ `-p 6093:6093` (Mandatory) - Doge WebUI port
+ ` -e DOGE_USER=<user>` (Optional) - Set Doge User : default to ```doge```
+ ` -e DOGE_PASSWD=<password>` (Optional) - Set Doge Password : default to ```DOGE```
+ ` -e NUT_USER=<user>` (Optional) - Set Nut User : default to ```AdMiN```
+ ` -e NUT_PASSWD=<password>` (Optional) - Set Nut Password : default to ```nYsTIaNICHIm```

## Using the application
Access the webui at ```http://<your IP>:6093``` and login as :
* login: `doge`
* password : `DOGE`

## Changelog

+ **4** : Removed built-in keys.txt, you must place keys.txt in a working directory

+ **3** : Now git clone instead of hard-copying doge and nut

+ **2** : Added ENV for custom user/passwd for nut and doge, see Usage

+ **1** : Made nut listen to 0.0.0.0 instead of 127.0.0.1

+ **initial_release** : Initial push with Doge 2.1.0
