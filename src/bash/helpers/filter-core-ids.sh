#!/bin/bash

cat | grep --color=never -o -P ".*(?=_libretro.*)"
