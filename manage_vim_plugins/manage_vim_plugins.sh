#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	manage_vim_plugins.sh
# 	05.09.2016.-13:44:51
# -----------------------------------------------------------------------------
# Description:
#   Bash script used to manage vim configuration and vim plugins. It combines
#   the functionality of all the previous vim management scripts.
# Usage:
#
# -----------------------------------------------------------------------------
# Script:

# New Vim location
VIM=$HOME/.vim

# File where the plugin list will be saved
PLUGINS_LIST=$VIM/repositories.txt

# List all the plugins in the $PLUGINS_LOCATION dir, extract the repository url
# with awk and save the repository url to the $PLUGINS_LIST file
get_repo_list(){
  >$PLUGINS_LIST

  ls -d $VIM/bundle/*/ | while read directory ; do
    echo $directory
    cd $directory
    git remote -v | grep push | awk '{print $2}' >> $PLUGINS_LIST
    cd ../
  done
}

# Update all the vim plugins using the git pull command
update_vim_plugins(){
  ls -d $VIM/bundle/*/ | while read directory ; do
    echo $directory
    # Go to dir, git pull and go back
    cd $directory
    git pull
    cd ../
  done
}

# Read repository list and clone vim plugins to the OUTPUT_LOCATION
# @param $1 PLUGINS_LIST file
read_and_clone() {
  cd $VIM/bundle

  cat $1 | while read repo_name ; do
    echo $repo_name
    git clone $repo_name
  done

  cd -
}

# Create the following directory structure
# .vim
#   - autoload
#   - backup
#   - bundle
#   - color
#   - disabled-plugins
create_dir_structure(){
  # Directories inside .vim
  local directories=(autoload backup bundle color disabled-plugins )

  for dir in "${directories[@]}"
  do
    mkdir -p $VIM/$dir
  done
}

# Install pathogen plugin manager
install_pathogen(){
  curl -LSso $VIM/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

help(){
  cat << EOF
  Usage: $0 [-h] [-i repo_file] [-u] [-p]

  Manage vim plugins

    -i ~/path/to/repo/file.txt
            Create dir structure, install pathogen and clone repositories
            full path to repository list is needed
    -u      Update installed Vim plugins from their repositories
    -p      Update the plugins list file
    -h      Show this help message
EOF


}

main(){
  while getopts 'i:uph' flag; do
    case "${flag}" in
      i)
        echo "Creating directories ..."
        create_dir_structure
        echo "Installing pathogen ..."
        install_pathogen
        echo "Installing plugins ..."
        plugins_list=${OPTARG}
        read_and_clone $plugins_list
          ;;
      u)
        echo "Updating vim plugins"
        update_vim_plugins
          ;;
      p)
        echo "Updating the plugins list"
        get_repo_list
          ;;
      h)
        help
          ;;
    esac
  done
}

main "$@"

exit 0
