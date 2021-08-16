#! /usr/bin/env bash

docker build --network host -t library_test -f ./test/dockerfile .

