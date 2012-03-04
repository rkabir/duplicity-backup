#!/bin/bash

# Grab credentials
source /Users/manur/Documents/Personal/backup_credentials.sh
ulimit -n 1024

# The source of your backup
export SOURCE=$HOME

# The destination
# Note that the bucket need not exist
# but does need to be unique amongst all
# Amazon S3 users. So, choose wisely.
#export DEST='s3+http://Oothoon/backup'
export DEST=file:///Volumes/Agni/Backup

duplicity incremental \
--encrypt-key ${GPG_KEY} \
--sign-key ${GPG_KEY} \
--include $HOME/Pictures/ \
--include $HOME/Documents/ \
--include $HOME/code/ \
--exclude $HOME \
--volsize 500 \
--verbosity 5 \
${SOURCE} ${DEST}

# Reset the ENV variables. Don’t need them sitting around
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export PASSPHRASE=
export GPG_KEY=
export SOURCE=
export DEST=


