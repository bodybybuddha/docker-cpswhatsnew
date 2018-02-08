### General ###
This image is a container for the cps-Whatsnew script, a newsletter script for the Calibre-Web application.

+ You can find out more about the cps-Whatsnew script [here](https://github.com/bodybybuddha/cps-WhatsNew).
+ You can find out more about the Calibre-Web application [here](https://github.com/janeczku/calibre-web).

### Features ###
The code to run the application is contained in its own directory.  All typical customizations can be done in the /custom directory.  This includes the email template that is used.

The container should copy default configuration/template files every time its started.  It should not overwrite any files.

### cron job ###

Basically this whole image was created to execute the cps-WhatsNew script on a scheduled basis.  A cron job has been created in the container to execute the script on Friday mornings. To change the cronjob, simply open a bash shell to the container and make your modifications directly.

### docker-compose file ###
Below is a sample docker-compose file you can use for this particular image:
		
	version: '2'
	services:
	  cpswhatsnew:
	    image: bodybybuddha/cpswhatsnew
	    container_name: cpswhatsnew
	    tty: true
	    volumes:
	      - /cpswhatsnew/logs:/logs
	      - /cpswhatsnew/custom:/custom
	      - /cps/config:/calibre-web/config
	    environment:
	      - DEBUG=false
	      - LOG_CFG=/custom/logging.json
	      - CPSWHATSNEW_CFG=/custom/config.json

The volume mount of '/cps/config:/calibre-web/config' is used if you are planning on using the Calibre-web database as an email source. 

Check out https://hub.docker.com/r/technosoft2000/calibre-web/ for a container for the Calibre-web application. You can simply create a docker-compose file that contains that application and this script quite easily.

### Support/More Info ###
You can find more information and support at http://recycledpapyr.us/cps-whatsnew/
 
