#!/bin/bash

# Accesss the variables:
source config.sh

# You shouldn't need to edit these:

PROJECT_ROOT_DIR="/c/xampp/htdocs/$LOCAL_PROJECT_NAME"
IMPORT_DIR="$PROJECT_ROOT_DIR/import"
SCRIPT_DIR="$PROJECT_ROOT_DIR/scripts"
EXPORT_DIR="$PROJECT_ROOT_DIR/export"
REMOTE_ARCHIVE_FILE="$REMOTE_PROJECT_NAME.remote.tar.gz"
REMOTE_DB_FILE="$REMOTE_DB_NAME.remote.sql"


# Create a backup of the local project
#. 'local-backup.sh'
# echo "Back up completed...";

# Let's start afresh. Delete the existing target dir
rm -rf $LOCAL_TARGET_DIR
echo "Local target directory deleted...";

# Uncompress the archive
tar -xvf $LOCAL_IMPORT_DIR/$REMOTE_ARCHIVE_FILE -C $PROJECT_ROOT_DIR
echo "Local target directory replaced with imported archive...";

mysql -u $LOCAL_DB_USER -p$LOCAL_DB_PASS $LOCAL_DB_NAME < $PROJECT_ROOT_DIR/httpdocs/database/$REMOTE_DB_FILE
echo "Local database replaced...";

# rm -rf $PROJECT_ROOT_DIR/database
# rm -rf $IMPORT_DIR/*
# echo "Clean up completed...";

# Make a noise!
echo -en "\007" 

# Celebrate!
echo "Success!";

# Reminder:
echo "Don't forget to S&R the DB!";