**Application**

[timesched](https://github.com/djmattyg007/timesched/)

**Description**

Timesched is a simple application that lets you organise meetups with other people around the world. It provides a simple timeline to visualise time periods across timezones, and to share proposed meeting times with other people.

**Build notes**

This uses a custom build from a fork of the timesched repository from mitsuhiko.

**Usage**
```
docker run -d \
    --net="host" \
    --name=<container name> \
    -v /etc/localtime:/etc/localtime \
    -v <path to SSL certificate files>:/etc/nginx/ssl \
    -e TIMESCHED_HTTP_SERVERNAME=<domain for HTTP endpoint> \
    -e TIMESCHED_HTTPS_SERVERNAME=<domain for HTTPS endpoint> \
    djmattyg007/timesched
```

Please replace all user variables in the above command defined by <> with the correct values.
You can opt out of HTTP or HTTPS by not supplying the relevant environment variable.

**Access application**

Connect to the site using the domain you specified above for the relevant protocol. Example:

http://www.myexampletimesched.com
https://secure.myexampletimesched.com
