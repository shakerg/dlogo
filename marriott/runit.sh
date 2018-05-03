#!/bin/bash
docker run -d --rm -p 80:80 --mount source=redvol,destination=/var/lib/nginx/html shaker242/dlogo:red
