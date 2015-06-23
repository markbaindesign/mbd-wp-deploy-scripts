#!/bin/bash

# Edit these variables:

# Local 
LOCAL_PROJECT_NAME=""
LOCAL_DB_NAME=""
LOCAL_DB_USER=""
LOCAL_DB_PASS=""

# Remote 
REMOTE_PROJECT_NAME=""
REMOTE_DB_NAME=""

###

# You shouldn't need to edit these:

PROJECT_ROOT_DIR="/c/xampp/htdocs/$LOCAL_PROJECT_NAME"
IMPORT_DIR="$PROJECT_ROOT_DIR/import"
SCRIPT_DIR="$PROJECT_ROOT_DIR/scripts"
EXPORT_DIR="$PROJECT_ROOT_DIR/export"
REMOTE_ARCHIVE_FILE="$REMOTE_PROJECT_NAME.remote.tar.gz"
REMOTE_DB_FILE="$REMOTE_DB_NAME.remote.sql"


# Create a backup of the local project
#. 'local-backup.sh'

echo '';
echo "* * * * * * * * * * * * * * * * * * * * * *";
echo "*                                         *";
echo "*           back up complete :)           *";
echo "*                                         *";
echo "* * * * * * * * * * * * * * * * * * * * * *";
echo '';

# Let's start afresh. Delete the existing httpdocs dir
rm -rf $PROJECT_ROOT_DIR/httpdocs

echo "* * * * * * * * * * * * * * * * * * * * * *";
echo "*                                         *"; 
echo "*           httpdocs deleted :)           *";
echo "*                                         *";
echo "* * * * * * * * * * * * * * * * * * * * * *";
echo '';

# Uncompress the archive
tar -xvf $IMPORT_DIR/$REMOTE_ARCHIVE_FILE -C $PROJECT_ROOT_DIR

echo "* * * * * * * * * * * * * * * * * * * * * *";
echo "*                                         *";
echo "*           httpdocs replaced :)          *";
echo "*                                         *";
echo "* * * * * * * * * * * * * * * * * * * * * *";
echo '';

mysql -u $LOCAL_DB_USER -p$LOCAL_DB_PASS $LOCAL_DB_NAME < $PROJECT_ROOT_DIR/httpdocs/database/$REMOTE_DB_FILE
echo "* **************************************** *";
echo "*                                          *";
echo "*              DB imported :)              *";
echo "*                                          *";
echo "* **************************************** *";
echo '';

# rm -rf $PROJECT_ROOT_DIR/database
# rm -rf $IMPORT_DIR/*
echo "* **************************************** *";
echo "*                                          *";
echo "*          Clean up completed :)           *";
echo "*                                          *";
echo "* **************************************** *";
echo '';

# Celebrate!
echo "* **************************************** *";
echo "*                                          *";
echo "*                                          *";
echo "*   Success! Don't forget to S&R the DB!   *";
echo "*                                          *";
echo "*                                          *";
echo "* **************************************** *";
echo '';

# make a noise!
echo -en "\007" 