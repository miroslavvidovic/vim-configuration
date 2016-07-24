#!/bin/bash

# -------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	clone_repos.sh
# 	03.03.2016.-09:05:03
# -------------------------------------------------------
# Description:
#   Bash script reads git repository urls form a text
#   file and then clones each repository into the current
#   working directory.
# Usage:
#   clone_repos.sh /path/to/txt/file
#   clone_repos.sh ~/Projects/git_repos.txt
# -------------------------------------------------------
# Script:


# Input variable is the system path to the text file with the repos.
input=$1
# Output directory is the location where the repositories whill be cloned
output_directory=~/.vim/bundle_2/

# Check to see if input is not set and show an error message.
function check_input(){
  if [[ -z "$input" ]]; then
    echo "No path to git repo list was provided."
    exit 0
  fi
}

# Go to output directory
mkdir -p $output_directory
cd $output_directory

# Read the text file and for each line in the file clone the
# git repository to the current directory.
function read_and_clone() {
  cat $input | while read repo_name ; do
    echo $repo_name
    git clone $repo_name
  done
}

function main_program(){
  check_input
  read_and_clone
}

# Run the script functions.
main_program

exit 0
