#!/bin/bash

# Edit these variables:

# Local 
LOCAL_PROJECT_NAME=""
LOCAL_DB_NAME=""

# Remote 
REMOTE_PROJECT_NAME=""
DB_USER=""
DB_PASS=""
# Special characters must be escaped!
DB_NAME=""
ROOT_DIR=""

###

# You shouldn't need to edit these:
PROJECT_ROOT_DIR="$ROOT_DIR/$REMOTE_PROJECT_NAME"
IMPORT_DIR="$PROJECT_ROOT_DIR/import"
ARCHIVE_FILE="$LOCAL_PROJECT_NAME.local.tar.gz"
DB_FILE="$LOCAL_DB_NAME.local.sql"

# Uncompress the archive
tar --overwrite -xvf $IMPORT_DIR/$ARCHIVE_FILE -C $PROJECT_ROOT_DIR
echo "* **************************************** *";
echo "*                                          *";
echo "*           httpdocs replaced :)           *";
echo "*                                          *";
echo "* **************************************** *";

mysql -u $DB_USER -p$DB_PASS $DB_NAME < $PROJECT_ROOT_DIR/database/$DB_FILE
echo "* **************************************** *";
echo "*                                          *";
echo "*              DB imported :)              *";
echo "*                                          *";
echo "* **************************************** *";

#rm -rf $PROJECT_ROOT_DIR/database
#rm -rf $IMPORT_DIR/*
echo "* **************************************** *";
echo "*                                          *";
echo "*          Clean up completed :)           *";
echo "*                                          *";
echo "* **************************************** *";

# Celebrate!
echo "* **************************************** *";
echo "*                                          *";
echo "*                                          *";
echo "*   Success! Don't forget to S&R the DB!   *";
echo "*                                          *";
echo "*                                          *";
echo "* **************************************** *";

# make a noise!
echo -en "\007" 