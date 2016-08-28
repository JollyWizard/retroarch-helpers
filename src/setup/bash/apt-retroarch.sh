#!/bin/bash

### 
# Overview: 
# 
# Adds and installs all retroarch/libretro from an ubuntu ppa.
# Automatic yes to all prompts
# requires sudo password if sudo is not active
###

sudo add-apt-repository -y ppa:libretro/stable

sudo apt-get update

sudo apt-get install -y retroarch retroarch-* libretro-*
