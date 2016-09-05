#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	update_vim_plugins.sh
# 	05.09.2016.-13:38:27
# -----------------------------------------------------------------------------
# Description:
#   Update all the plugins in .vim/bundle directory
# Usage:
#
# -----------------------------------------------------------------------------
# Script:

plugins_path=~/.vim/bundle

ls -d $plugins_path/*/ | while read directory ; do
  echo $directory
  cd $directory
  git pull
  cd ../
done

exit 0
