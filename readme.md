<h2>General</h2>
<p>This image is a container for the cps-Whatsnew script, a newsletter script for the Calibre-Web application.</p>

* You can find out more about the cps-Whatsnew script [here](https://github.com/bodybybuddha/cps-WhatsNew).
* You can find out more about the Calibre-Web application [here](https://github.com/janeczku/calibre-web).

<h2>Features</h2>
The code to run the application is contained in its own directory.  All typical customizations can be done in the /custom directory.  This includes the email template that is used.

The container should copy default configuration/template files every time its started.  It should not overwrite any files.

<h2>cron job</h2>

Basically this whole image was created to execute the cps-WhatsNew script on a scheduled basis.  A cron job has been created in the container to execute the script on Friday mornings. To change the cronjob, simply open a bash shell to the container and make your modifications directly.

<h2>docker-compose file</h2>
<p>Below is a sample docker-compose file you can use for this particular image:</p>
		
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

<p>The volume mount of '/cps/config:/calibre-web/config' is used if you are planning on using the Calibre-web database as an email source.</p> 

<p>Check out [technosoft2000/calibre-web](https://hub.docker.com/r/technosoft2000/calibre-web/) for a container for the Calibre-web application. You can simply create a docker-compose file that contains that application and this script quite easily.

<h2>Support/More Info</h2>
You can find more information and support at [http://recycledpapyr.us/cps-whatsnew/](http://recycledpapyr.us/cps-whatsnew/)