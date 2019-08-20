#!/bin/bash

# This script will:
#
# 1. clone the rabid-dotfiles repo to a local temp dir
# 2. copy various dotfiles from it to the current working directory
#
# Instructions for usage are in the README of `rabid-dotfiles`

# timestamp is the current time as number of seconds since the epoch e.g.
# 1433198158. It is used to build a unique path within /tmp for the repo we are
# going to clone
timestamp=`date +"%s"`

# local_repo is where the `rabid-dotfiles` repo will be cloned locally
local_repo="/tmp/rabid-dotfiles-$timestamp"

# get the current working dir
project_root=`pwd`

# clone the rabid-dotfiles repo into our local temp dir
echo "Cloning rabid-dotfiles repo into $local_repo ..."
git clone git@bitbucket.org:rabidtech/rabid-dotfiles.git $local_repo

# copy .editorconfig from the local rabid-dotfiles clone to the current working
# directory
echo "  Creating/overwriting ${project_root}/.editorconfig"
cp $local_repo/.editorconfig $project_root

# copy .rubocop.yml from the local rabid-dotfiles clone to the current working
# directory
echo "  Creating/overwriting ${project_root}/.rubocop.yml"
cp $local_repo/.rubocop.yml $project_root

# copy .rubocop.yml from the local rabid-dotfiles clone to the current working
# directory
echo "  Creating/overwriting ${project_root}/.eslintrc.yml"
cp $local_repo/.eslintrc.yml $project_root

# delete the local repo clone now what we are finished
echo "  Removing repo clone from $local_repo"
rm -rf $local_repo

echo "All done. May the lints be ever in your favour."
