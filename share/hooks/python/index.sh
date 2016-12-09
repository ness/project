#!/bin/bash

old_IFS=$IFS
IFS=$'\n'

SOURCE_DIRS=( $(project_configuration iter --key source_dirs --format newline ) )
# LIB_DIRS=( $(project_configuration show --key lib_dirs --format newline ) )

IFS=$old_IFS


ctags -R --fields=+l --languages=python --python-kinds=-iv -f $PROJECT_DIR/.tags.sources "${SOURCE_DIRS[@]}"
ctags -R --fields=+l --languages=python --python-kinds=-iv -f $PROJECT_DIR/.tags.lib "${LIB_DIRS[@]}"
