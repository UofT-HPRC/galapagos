#!/bin/sh
docker inspect --latest --format {{.ID}} > id.txt


