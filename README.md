**Application**

[JSON Editor](https://github.com/josdejong/jsoneditor/)
[JSON Editor Online](https://github.com/djmattyg007/jsoneditoronline/)

**Description**

JSON Editor is a web-based tool that lets you view, edit, format and validate JSON.
It's provided as a library, making it easy to customise and integrate into existing
applications, or to run as a standalone application.

**Usage**

```
docker run \
    --rm \
    -p 8080:80 \
    --name=jsoneditoronline \
    djmattyg007/jsoneditor
```

Now access ``http://localhost:8080`` in your browser to access the application.
