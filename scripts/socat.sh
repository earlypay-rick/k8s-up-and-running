#!/usr/bin/env bash

local_host=localhost
local_port=18080
redirect_host=192.168.49.2
redirect_port=31880

socat \
  "tcp-listen:${local_port},reuseaddr,fork,bind=${local_host}" \
  "tcp:${redirect_host}:${redirect_port}"
