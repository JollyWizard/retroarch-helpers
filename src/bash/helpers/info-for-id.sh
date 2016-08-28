#!/bin/bash

info_file=$(source info-file-for-id.sh $1)

cat $info_file
