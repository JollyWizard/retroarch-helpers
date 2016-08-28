#retroarch-helpers

*Bash scripts for working with Retroarch on ubuntu-based desktops*

## Overview

These are some scripts I'm working on as part of a project to streamline the 
installation, configuration, and integration of Retroarch on Ubuntu based
desktops.

I discovered Retroarch through Emulation-Station and thought it would be a magic
bullet for all-in-one emulation.  Turns out there is a lot of redundant configuration
to integrate it with another front-end.

These helpers are intended to provide a baseline.

## Project Goals

I want to be able to scan the current install of retroarch, and generate configuration for other front-ends.

Emulation-Station is my baseline use case, but ideally the project will integrate with others and facilite newcomers.

* Auto-generate an Emulation-Station es_systems.cfg based on the current retroarch install.

By extension, and more generally:

* Provide command line access to information about the current modules available in retroarch.

Retroarch requires explicit static library locations as a command line parameter to launch a rom directly.  This is because
the system cannot know for sure what to choose without further configuration.  

In the emulation station use case, the front-end already knows, but a universal default can't be configured because it can't
know what cores retroarch has.  Retroarch also does not provide a default for the core (unlike derivate projects RetroPie and
Lakka).  I would like to solve this problem by creating an abstraction at the command line level, so that each system has it's
own command (i.e. `nes` for Nintento).  This will allow a default use case to be deduced, and changed without having to inject
such nonsense into the config file

* Create command line alias to configure and execute the default retroarch core for a given system.

I also found the controller configuration in retroarch to be a cumbersome nightmare.  I want to streamline that.  
I primarily use DS3 controllers on Linux Mint.  I want that to work at the time I install

* Configure common controllers, starting with DS3, from the command line.  Ideally, this should be an autodetect situation.

## Current State

The project is currently divided into two sections

* **[helpers](src/main/helpers/bash)**  
  
  This is my first nights work on the project. With help from the forums, I found the data files where the cores are described.
  I finished the night with scripts that list the cores currently installed on the system.  These are dependent on a ppa install
  standard environment.
  
* **[setup](src/main/setup/bash)**  
      
  Right now, this is just a helper script to install all retroarch resources from the ppa.  Later, I might add more fine-tuned
  install options.
    
  Once I've reached the point where key project goals are executable from the project, this will become the location where
  the scripts are installed as system resources.
 
- - -
  
Ya'll come back now,
- Jolly Wizard
  
  
