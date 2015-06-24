#!/bin/bash

# Accesss the variables:
source config.sh

# You shouldn't need to edit these:
LOCAL_ARCHIVE_FILE="$LOCAL_PROJECT_NAME.local.tar.gz"
LOCAL_DB_FILE="$LOCAL_DB_NAME.local.sql"

# Create a backup of the local project
#. 'local-backup.sh'
# echo "Back up completed...";

# Let's start afresh. Delete the existing target dir
# rm -rf $REMOTE_TARGET_DIR
# echo "Remote target directory ($REMOTE_TARGET_DIR) deleted...";

# Uncompress the archive and overwrite
tar --overwrite -xvf $REMOTE_IMPORT_DIR/$LOCAL_ARCHIVE_FILE -C $REMOTE_ROOT_DIR
echo "* **************************************** *";
echo "*                                          *";
echo "*           httpdocs replaced :)           *";
echo "*                                          *";
echo "* **************************************** *";

mysql -u $REMOTE_DB_USER -p$REMOTE_DB_PASS $REMOTE_DB_NAME < $REMOTE_ROOT_DIR/database/$LOCAL_DB_FILE
echo "* **************************************** *";
echo "*                                          *";
echo "*              DB imported :)              *";
echo "*                                          *";
echo "* **************************************** *";

# rm -rf $PROJECT_ROOT_DIR/database
# rm -rf $REMOTE_IMPORT_DIR/*
# echo "Clean up completed...";

# Make a noise!
echo -en "\007" 

# Celebrate!
echo "Success!";

# Reminder:
echo "Don't forget to S&R the DB!";