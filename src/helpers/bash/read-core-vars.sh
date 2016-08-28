#!/bin/bash

id=$1
id_file=$(bash info-file-for-id.sh $id)

source retroarch-var.sh $id_file corename core_corename
source retroarch-var.sh $id_file systemname core_systemname
source retroarch-var.sh $id_file display_name core_display_name

