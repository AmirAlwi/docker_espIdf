#!/bin/bash

docker build --build-arg IDF_CLONE_BRANCH_OR_TAG=release/v6.0 --build-arg IDF_CLONE_SHALLOW=1 -t esp-idf-v6.0-generic-all .