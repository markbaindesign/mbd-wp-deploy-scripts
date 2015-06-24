#!/bin/bash

# Accesss the variables:
source config.sh

# You shouldn't need to edit these:
LOCAL_ARCHIVE_FILE="$LOCAL_PROJECT_NAME.local.tar.gz"
LOCAL_DB_FILE="$LOCAL_DB_NAME.local.sql"
REMOTE_TMP_DIR="$REMOTE_ROOT_DIR/tmp"

# Create temp directory
mkdir /$REMOTE_TMP_DIR/
echo 'Creating temp directory...';
echo -ne 'Complete!\n'

# Copy wp-config to temp directory
cp  /$REMOTE_TARGET_DIR/wp-config.php /$REMOTE_TMP_DIR/
echo 'Copying config to temporary dir...';
echo -ne 'Complete!\n'

# Create a backup of the local project
#. 'local-backup.sh'
# echo "Back up completed...";

# Let's start afresh. Delete the existing target dir
rm -rf /$REMOTE_TARGET_DIR/
echo -ne 'Deleting the target dir... #####                     (33%)\r'
sleep 1
echo -ne 'Deleting the target dir... #############             (66%)\r'
sleep 1
echo -ne 'Deleting the target dir... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Create a new target directory
mkdir /$REMOTE_TARGET_DIR/
echo 'Recreating target directory...';
echo -ne 'Complete!\n'

# Copy wp-config to target directory
cp  /$REMOTE_TMP_DIR/wp-config.php /$REMOTE_TARGET_DIR
echo 'Copying config to target dir...';
echo -ne 'Complete!\n'

# Uncompress the archive
tar -xf /$REMOTE_IMPORT_DIR/$LOCAL_ARCHIVE_FILE -C /$REMOTE_TMP_DIR/
echo -ne 'Uncompressing the archive... #####                     (33%)\r'
sleep 1
echo -ne 'Uncompressing the archive... #############             (66%)\r'
sleep 1
echo -ne 'Uncompressing the archive... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

mysql -u $REMOTE_DB_USER -p$REMOTE_DB_PASS $REMOTE_DB_NAME < /$REMOTE_TMP_DIR/database/$LOCAL_DB_FILE
echo -ne 'Importing the database... #####                     (33%)\r'
sleep 1
echo -ne 'Importing the database... #############             (66%)\r'
sleep 1
echo -ne 'Importing the database... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Copy files to target directory
cp  -a /$REMOTE_TMP_DIR/files/. /$REMOTE_TARGET_DIR/
echo -ne 'Copying files... #####                     (33%)\r'
sleep 1
echo -ne 'Copying files... #############             (66%)\r'
sleep 1
echo -ne 'Copying files... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

rm -rf /$REMOTE_TMP_DIR/
# rm -rf /$REMOTE_IMPORT_DIR/*
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

# Reminder:
echo "Don't forget to S&R the DB!";