#retroarch-helpers

*Bash scripts for working with Retroarch on ubuntu-based desktops*

## Overview

These are some scripts I'm working on as part of a project to streamline the installation, configuration, and integration of Retroarch on Ubuntu based desktops.

I discovered Retroarch through Emulation-Station and thought it would be a magic bullet for all-in-one emulation.  Turns out there is a lot of redundant configuration to integrate it with another front-end.

These helpers are intended to provide a baseline.

## Project Goals

I want to be able to scan the current install of retroarch, and generate configuration for other front-ends.

Emulation-Station is my baseline use case, but ideally the project will integrate with others and facilite newcomers.

* Auto-generate an Emulation-Station es_systems.cfg based on the current retroarch install.

By extension, and more generally:

* Provide command line access to information about the current modules available in retroarch.

Retroarch requires explicit static library locations as a command line parameter to launch a rom directly.  This is because the system cannot know for sure what to choose without further configuration.  

In the emulation station use case, the front-end already knows what the system is, but a universal default can't be configured because it can't know what cores retroarch has installed, nor does Retroarch provide a default core for each system (unlike derivate projects RetroPie and Lakka).  This means there is no command line syntax to execute based on the system rather than
the target emulator. 

I would like to solve this problem by creating an abstraction at the command line level, so that each system has its own command (i.e. `nes %ROM%` instead of `retroarch -L /path/to/core/ %ROM`).  This will allow a default use case to be deduced, and changed without having to inject such nonsense into the config file

* Create command line aliases to configure and execute the default retroarch core for each system.

I also found the controller configuration in retroarch to be a cumbersome nightmare.  I want to streamline that.  

I primarily use DS3 controllers on Linux Mint.  I want those to work on retroarchs first boot, rather than have to open the app and set it up.

* Configure common controllers, starting with DS3, from the command line.  Ideally, this should be an autodetect situation.

## Current State

The project is currently divided into two sections. All work is currently proof of concept and not well documented.

* **[helpers](src/helpers/bash)**  
  
  This is my first nights work on the project. With help from the forums, I found the data files where the cores are described. I finished the night with scripts that can list the cores ([i.e.](src/helpers/bash/list-core-systems.sh)) currently installed on the system.  These are dependent on a ppa install standard environment.
  
* **[setup](src/setup/bash)**  
      
  Right now, this is just a helper script to install all retroarch resources from the ppa.  Later, I might add more fine-tuned
  install options.
    
  Once I've reached the point where key project goals are executable from the project, this will become the location where
  the scripts are installed as system resources.
 
- - -
  
Ya'll come back now,
- Jolly Wizard
  
  
