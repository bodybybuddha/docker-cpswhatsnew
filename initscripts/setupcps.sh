#!/bin/sh

#copy over the default customfiles - do not overwrite anything already there!!
false | cp -i -R /defaultcustom/* /custom 2>/dev/null

#now run the crond daemon in the foreground
/usr/sbin/crond -f -d 0

