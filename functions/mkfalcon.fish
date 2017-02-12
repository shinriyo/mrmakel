function mkfalcon
    # check argument
    if count $argv > /dev/null
    else
        echo 'Please input file name for argument.'
        return
    end

    # check file exists
    if test -e './'$argv'.py'
        echo -sn './'$argv'.py already exists. Continue to override? [Y/n] ' > /dev/stderr
        __fisher_get_key | read -l yn
        echo $yn
        switch "$yn"
            case n N
            return 1
        end
    end

    # make python file
    string trim '#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import falcon


class HelloResource(object):

    def on_get(self, req, resp):
        msg = {
            "message": "Welcome to the Falcon"
        }
        resp.body = json.dumps(msg)

app = falcon.API()
app.add_route("/", HelloResource())


if __name__ == "__main__":
    from wsgiref import simple_server
    httpd = simple_server.make_server("127.0.0.1", 8000, app)
    httpd.serve_forever()
' > ./$argv.py
    echo './'$argv'.py file was created.'
end
