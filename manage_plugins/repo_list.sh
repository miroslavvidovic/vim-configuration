#!/bin/bash

# -------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	repo_list.sh
# 	03.03.2016.-08:20:20
# -------------------------------------------------------
# Description:
#   Script lists all the directories in the current
#   working directory. Then for each directory using git
#   remote -v command script finds the git repo information.
#   After that useing grep and awk it filters only the repo
#   url which is then saved into a text file.
#
# Usage:
#   repo_list.sh
# -------------------------------------------------------
# Script:

plugins_path=~/.vim/bundle
output_file=~/.vim/repositories.txt

ls -d $plugins_path/*/ | while read file_name ; do
  echo $file_name
  cd $file_name
  git remote -v | grep push | awk '{print $2}' >> $output_file
  cd ../
done

exit 0
