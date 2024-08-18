#!/bin/sh

CMDNAME=`basename $0`

while getopts n OPT
do
  case $OPT in
    "n" ) DRY_RUN="--dry-run" ;;
      * ) echo "Usage: $CMDNAME [-n]" 1>&2
          exit 1 ;;
  esac
done

SOURCE=${HOME}/
TARGET=/Volumes/Backup/home-backup

[[ ! -d $TARGET ]] && echo "Target directory does NOT exists." && exit 1

rsync -av --stats --delete-excluded --modify-window=1 $DRY_RUN \
--include "/.ssh/" \
--include "/.dotfiles/" \
--exclude "/.*" \
--exclude "/Applications/" \
--exclude "/Applications (Parallels)/" \
--exclude "/Dropbox/" \
--exclude "/Library/" \
--exclude ".DS_Store" \
--exclude ".localized" \
--exclude ".git" \
${SOURCE} ${TARGET}