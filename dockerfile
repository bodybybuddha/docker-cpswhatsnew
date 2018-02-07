FROM python:2.7-alpine3.7
MAINTAINER bodybybuddha <jtaylor@no-trace.net>

#Adding bash & all build libraries  
RUN apk add --no-cache bash \
	build-base \ 
	python-dev \ 
	py-pip \ 
	libxml2-dev \
	libxslt-dev \ 
	jpeg-dev \ 
	zlib-dev 

#Copy Code over - need requirements file!
COPY . /cps-whatsnew
WORKDIR /cps-whatsnew

#Alpine puts needed headers in a different area
ENV LIBRARY_PATH=/lib:/usr/lib \
    CPSWHATSNEW_CFG=/custom/config.json \
    LOG_CFG="/custom/logging.json"

RUN pip install -r requirements.txt

#Setup the initial cron job:
RUN touch crontab.tmp \
    && echo '0 6 * * 5 /cps-whatsnew/run-cpsWhatsNew.sh >/dev/null 2>&1' > crontab.tmp \
    && crontab crontab.tmp \
    && rm -rf crontab.tmp

VOLUME /logs \ 
       /custom \  
       /etc/localtime:/etc/localtime:ro

RUN chmod +x /cps-whatsnew/initscripts/setupcps.sh  && \
    chmod +x /cps-whatsnew/run-cpsWhatsNew.sh

CMD ["sh", "/cps-whatsnew/initscripts/setupcps.sh"]
