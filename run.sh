#!/bin/sh

# This will run a new Rexster container detached

docker run --name=rexster -h=oseraf-rexster -p 8182:8182 -p 8183:8183 -p 8184:8184 -d oseraf/rexster
