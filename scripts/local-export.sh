#!/bin/bash
# Accesss the variables:
source config.sh

# You shouldn't need to edit these:
LOCAL_NOW=$(date +"%Y-%m-%d-%H%M")
LOCAL_FILE="$LOCAL_PROJECT_NAME.local.tar"
LOCAL_DESTINATION_DIR="$LOCAL_EXPORT_DIR/$LOCAL_NOW"
LOCAL_TMP_DIR="$LOCAL_ROOT_DIR/tmp"
LOCAL_DB_FILE="$LOCAL_DB_NAME.local.sql"
LOCAL_FILES_TO_EXCLUDE="local-export-exclude.txt"
LOCAL_FILES_TRANSFORM="s,^$LOCAL_TARGET_DIR,files,"
LOCAL_DB_TRANSFORM="s,^$LOCAL_TMP_DIR,database,"

# Create temp directory
mkdir /$LOCAL_TMP_DIR
mkdir /$LOCAL_TMP_DIR/database
mkdir /$LOCAL_TMP_DIR/files
echo 'Creating local temp directory...';
echo -ne 'Complete!\n'

# Dump the DB into the temp dir
mysqldump -u $LOCAL_DB_USER -p$LOCAL_DB_PASS $LOCAL_DB_NAME > /$LOCAL_TMP_DIR/$LOCAL_DB_FILE
echo -ne 'Dumping the local database... #####                     (33%)\r'
sleep 1
echo -ne 'Dumping the local database... #############             (66%)\r'
sleep 1
echo -ne 'Dumping the local database... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Archive the site files; flatten the tree structure.
tar -cf /$LOCAL_TMP_DIR/$LOCAL_FILE -X $LOCAL_FILES_TO_EXCLUDE --transform $LOCAL_FILES_TRANSFORM /$LOCAL_TARGET_DIR
echo -ne 'Archiving local target directory... #####                     (33%)\r'
sleep 1
echo -ne 'Archiving local target directory... #############             (66%)\r'
sleep 1
echo -ne 'Archiving local target directory... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Append it to the tarball; flatten the tree structure.
tar --append --file=/$LOCAL_TMP_DIR/$LOCAL_FILE --transform $LOCAL_DB_TRANSFORM /$LOCAL_TMP_DIR/$LOCAL_DB_FILE
echo -ne 'Appending database dump to tarball... #####                     (33%)\r'
sleep 1
echo -ne 'Appending database dump to tarball... #############             (66%)\r'
sleep 1
echo -ne 'Appending database dump to tarball... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Compress the tarball
gzip -9 /$LOCAL_TMP_DIR/$LOCAL_FILE
echo -ne 'Compressing the tarball... #####                     (33%)\r'
sleep 1
echo -ne 'Compressing the tarball... #############             (66%)\r'
sleep 1
echo -ne 'Compressing the tarball... #######################   (100%)\r'
echo -ne '\n'
echo -ne 'Complete!\n'

# Make a dir in export target dir for this archive
mkdir /$LOCAL_DESTINATION_DIR
echo 'Creating '$LOCAL_DESTINATION_DIR'...';
echo -ne 'Complete!\n'

# Move out of tmp
mv /$LOCAL_TMP_DIR/$LOCAL_FILE.gz /$LOCAL_DESTINATION_DIR
echo 'Moving the archive to '$LOCAL_DESTINATION_DIR'...';
echo -ne 'Complete!\n'

# Clean up
rm /$LOCAL_TMP_DIR/$LOCAL_DB_FILE
echo 'Deleting '$LOCAL_TMP_DIR/$LOCAL_DB_FILE'...';
echo -ne 'Complete!\n'

rm -rf /$LOCAL_TMP_DIR


# Celebrate!
echo "Success!";

# make a noise!
echo -en "\007" 