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

* **[helpers](src/bash/helpers)**  
  
  This is where early work on the project is taking place.

  * With help from the forums, I found the data files where the cores are described. I finished the first night with scripts that can list the cores ([i.e.](src/bash/helpers/list-core-systems.sh)) currently installed on the system.  These are dependent on a ppa install standard environment.
  * More work centered on making the scripts run consistently and independent of working directory.  Also, focus on DRY, and system for debug output.
  * With things a little cleaner, I compiled a list of the installed core system_names, and generated a file which assigns the long form names to brief platform identifiers based on emulationstation conventions (see [themes/platforms](http://emulationstation.org/gettingstarted.html).  These should facilitate interoperability with front-ends and command line aliasing.  I then worked on mapping each core to those identifiers.  During this phase, I continued to streamline the interaction and dependencies between scripts.
  * With a little more finagling, I then reached a key goal: [list-core-ids-by-platform.sh](src/bash/helpers/list-core-ids-by-platform.sh). This feature demonstrates the ability to list cores based on target platform, rather than rely on the user to explicitly manage the many-to-many relationship.  
  
* **[setup](src/bash/setup)**  
      
  Right now, this is just a helper script to install all retroarch resources from the ppa.  Later, I might add more fine-tuned
  install options.
    
  Once I've reached the point where key project goals are executable from the project, this will become the location where
  the scripts are installed as system resources.
 
- - -
## Debug Mode

if `$DEBUG` is set/non-empty, detailed processing information will appear on stderr, colored in yellow.

This must be set outside of the provided scripts.

- - -
  
Ya'll come back now,
- Jolly Wizard
  
  
