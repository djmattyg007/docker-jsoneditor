**Application**

[JSON Editor](https://github.com/josdejong/jsoneditor/)

**Description**

JSON Editor is a web-based tool that lets you view, edit, format and validate JSON. It's provided as a library, making it easy to customise and integrate into existing applications, or to run as a standalone application.

**Build notes**

A custom index.html file is contained within this repository that powers the frontend.

**Usage**
```
docker run -d \
    --net="host" \
    --name=<container name> \
    -v /etc/localtime:/etc/localtime \
    -v <path to SSL certificate files>:/etc/nginx/ssl \
    -e TIMESCHED_HTTP_SERVERNAME=<domain for HTTP endpoint> \
    -e TIMESCHED_HTTPS_SERVERNAME=<domain for HTTPS endpoint> \
    djmattyg007/jsoneditor
```

Please replace all user variables in the above command defined by <> with the correct values.
You can opt out of HTTP or HTTPS by not supplying the relevant environment variable.

**Access application**

Connect to the site using the domain you specified above for the relevant protocol. Example:

http://www.myexamplejsoneditor.com
https://secure.myexamplejsoneditor.com
