#!/bin/bash

# -------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	get_repo_list.sh
# 	03.03.2016.-08:20:20
# -------------------------------------------------------
# Description:
#   Script lists all the directories in the vim main
#   directory. Then for each directory using git
#   remote -v command script finds the git repo information.
#   After that using grep and awk it filters only the repo
#   url which is then saved into a text file.
#   The text file is used like a plugin database.
#
# Usage:
#   repo_list.sh
# -------------------------------------------------------
# Script:

# Location of vim plugins
plugins_path=~/.vim/bundle

# File where the vim plugin list will be saved
output_file=~/.vim/repositories.txt

# Clear any previous content if the file exists
>$output_file

ls -d $plugins_path/*/ | while read file_name ; do
  echo $file_name
  cd $file_name
  git remote -v | grep push | awk '{print $2}' >> $output_file
  cd ../
done

exit 0
