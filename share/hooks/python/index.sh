#!/bin/bash

ctags -R --fields=+l --languages=python --python-kinds=-iv -f $PROJECT_DIR/.tags .
