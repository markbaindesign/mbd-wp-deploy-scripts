#!/bin/bash
# Accesss the variables:
source config.sh

# You shouldn't need to edit these:
REMOTE_NOW=$(date +"%Y-%m-%d-%H%M")
REMOTE_FILE="$REMOTE_PROJECT_NAME.remote.tar"
REMOTE_DESTINATION_DIR="$REMOTE_EXPORT_DIR/$REMOTE_NOW"
REMOTE_TMP_DIR="$REMOTE_ROOT_DIR/tmp"
REMOTE_DB_FILE="$REMOTE_DB_NAME.remote.sql"
REMOTE_FILES_TO_EXCLUDE="remote-export-exclude.txt"
REMOTE_FILES_TRANSFORM="s,^$REMOTE_TARGET_DIR,files,"
REMOTE_DB_TRANSFORM="s,^$REMOTE_TMP_DIR,database,"

# Create temp directory
mkdir /$REMOTE_TMP_DIR
mkdir /$REMOTE_TMP_DIR/database
mkdir /$REMOTE_TMP_DIR/files
echo 'Creating remote temp directory...';
echo -ne 'Complete!\n'

# Dump the DB into the temp dir
mysqldump -u $REMOTE_DB_USER -p$REMOTE_DB_PASS $REMOTE_DB_NAME > /$REMOTE_TMP_DIR/$REMOTE_DB_FILE
echo -ne 'Dumping the remote database... #####                     (33%)\r'
sleep 1
echo -ne 'Dumping the remote database... #############             (66%)\r'
sleep 1
echo -ne 'Dumping the remote database... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Archive the site files; flatten the tree structure.
tar -cf /$REMOTE_TMP_DIR/$REMOTE_FILE -X $REMOTE_FILES_TO_EXCLUDE --transform $REMOTE_FILES_TRANSFORM /$REMOTE_TARGET_DIR
echo -ne 'Archiving remote target directory... #####                     (33%)\r'
sleep 1
echo -ne 'Archiving remote target directory... #############             (66%)\r'
sleep 1
echo -ne 'Archiving remote target directory... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Append it to the tarball; flatten the tree structure.
tar --append --file=/$REMOTE_TMP_DIR/$REMOTE_FILE --transform $REMOTE_DB_TRANSFORM /$REMOTE_TMP_DIR/$REMOTE_DB_FILE
echo -ne 'Appending database dump to tarball... #####                     (33%)\r'
sleep 1
echo -ne 'Appending database dump to tarball... #############             (66%)\r'
sleep 1
echo -ne 'Appending database dump to tarball... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Compress the tarball
gzip -9 /$REMOTE_TMP_DIR/$REMOTE_FILE
echo -ne 'Compressing the tarball... #####                     (33%)\r'
sleep 1
echo -ne 'Compressing the tarball... #############             (66%)\r'
sleep 1
echo -ne 'Compressing the tarball... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Make a dir in export target dir for this archive
mkdir /$REMOTE_DESTINATION_DIR
echo 'Creating '$REMOTE_DESTINATION_DIR'...';
echo -ne 'Complete!\n'

# Move out of tmp
mv /$REMOTE_TMP_DIR/$REMOTE_FILE.gz /$REMOTE_DESTINATION_DIR
echo 'Moving the archive to '$REMOTE_DESTINATION_DIR'...';
echo -ne 'Complete!\n'

# Clean up
rm /$REMOTE_TMP_DIR/$REMOTE_DB_FILE
echo 'Deleting '$REMOTE_TMP_DIR/$REMOTE_DB_FILE'...';
echo -ne 'Complete!\n'

rm -rf /$REMOTE_TMP_DIR


# Celebrate!
echo "Success!";

# make a noise!
echo -en "\007" 