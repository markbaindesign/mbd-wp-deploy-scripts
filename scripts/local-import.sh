#!/bin/bash

# Accesss the variables:
source config.sh

# You shouldn't need to edit these:
REMOTE_ARCHIVE_FILE="$REMOTE_PROJECT_NAME.remote.tar.gz"
REMOTE_DB_FILE="$REMOTE_DB_NAME.remote.sql"
LOCAL_TMP_DIR="$LOCAL_ROOT_DIR/tmp"

# Create temp directory
mkdir /$LOCAL_TMP_DIR/
echo 'Creating temp directory...';
echo -ne 'Complete!\n'

# Copy wp-config to temp directory
cp  /$LOCAL_TARGET_DIR/wp-config.php /$LOCAL_TMP_DIR/
echo 'Copying config to temporary dir...';
echo -ne 'Complete!\n'

# Create a backup of the local project
#. 'local-backup.sh'
# echo "Back up completed...";

# Let's start afresh. Delete the existing target dir
rm -rf /$LOCAL_TARGET_DIR/
echo -ne 'Deleting the target dir... #####                     (33%)\r'
sleep 1
echo -ne 'Deleting the target dir... #############             (66%)\r'
sleep 1
echo -ne 'Deleting the target dir... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Create a new target directory
mkdir /$LOCAL_TARGET_DIR/
echo 'Recreating target directory...';
echo -ne 'Complete!\n'

# Copy wp-config to target directory
cp  /$LOCAL_TMP_DIR/wp-config.php /$LOCAL_TARGET_DIR
echo 'Copying config to target dir...';
echo -ne 'Complete!\n'

# Uncompress the archive
tar -xf /$LOCAL_IMPORT_DIR/$REMOTE_ARCHIVE_FILE -C /$LOCAL_TMP_DIR/
echo -ne 'Uncompressing the archive... #####                     (33%)\r'
sleep 1
echo -ne 'Uncompressing the archive... #############             (66%)\r'
sleep 1
echo -ne 'Uncompressing the archive... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

mysql -u $LOCAL_DB_USER -p$LOCAL_DB_PASS $LOCAL_DB_NAME < /$LOCAL_TMP_DIR/database/$REMOTE_DB_FILE
echo -ne 'Importing the database... #####                     (33%)\r'
sleep 1
echo -ne 'Importing the database... #############             (66%)\r'
sleep 1
echo -ne 'Importing the database... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Replace all instances of the URL in the database
php srdb.cli.php -h localhost -n $LOCAL_DB_NAME -u $LOCAL_DB_USER -p$LOCAL_DB_PASS -s $REMOTE_DOMAIN -r $LOCAL_DOMAIN

# Copy files to target directory
cp  -a /$LOCAL_TMP_DIR/files/. /$LOCAL_TARGET_DIR/
echo -ne 'Copying files... #####                     (33%)\r'
sleep 1
echo -ne 'Copying files... #############             (66%)\r'
sleep 1
echo -ne 'Copying files... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

rm -rf /$LOCAL_TMP_DIR/
# rm -rf /$LOCAL_IMPORT_DIR/*
echo -ne 'Tidying up... #####                     (33%)\r'
sleep 1
echo -ne 'Tidying up... #############             (66%)\r'
sleep 1
echo -ne 'Tidying up... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Make a noise!
echo -en "\007" 

# Celebrate!
echo "Success!";
echo -ne '\n'
echo "⊂(▀¯▀⊂)"