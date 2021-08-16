#! /usr/bin/env bash

docker build --network host -t library_downloader .

docker run --rm --network host -v ${PWD}/libraries:/R_download_packages/libraries library_downloader 