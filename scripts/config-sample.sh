#!/bin/bash

# Local environmental variables

## Paths
### No leading slashes!

### Local project name for naming archives
LOCAL_PROJECT_NAME=""

### Local root directory
### i.e. 
### LOCAL_ROOT_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts"
LOCAL_ROOT_DIR=""


### Directory to target when importing/exporting
### i.e. 
### LOCAL_EXPORT_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts/httpdocs"
LOCAL_TARGET_DIR=""

### Directory where the imported archive can be found
### i.e. 
### LOCAL_EXPORT_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts/import"
LOCAL_IMPORT_DIR=""

### Directory to output the archive
### i.e. 
### LOCAL_EXPORT_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts/export"
LOCAL_EXPORT_DIR=""

## WordPress

### WordPress local database name
LOCAL_DB_NAME=""

### WordPress local database name
LOCAL_DB_USER=""

### WordPress local database password
### Special characters must be escaped!
LOCAL_DB_PASS=""

# Remote environmental variables

## Paths

### Remote project name for naming archives
REMOTE_PROJECT_NAME=""

### Remote root directory
### i.e. 
### REMOTE_EXPORT_DIR="home/markba/www/dev/mbd-wp-deploy-scripts"
REMOTE_ROOT_DIR=""

### Directory to target when importing/exporting
### i.e. 
### REMOTE_EXPORT_DIR="home/markba/www/dev/mbd-wp-deploy-scripts/httpdocs"
REMOTE_TARGET_DIR=""

### Directory where the imported archive can be found
### i.e. 
### REMOTE_EXPORT_DIR="home/markba/www/dev/mbd-wp-deploy-scripts/import"
REMOTE_IMPORT_DIR=""

### Directory to output the archive
### i.e. 
### REMOTE_EXPORT_DIR="home/markba/www/dev/mbd-wp-deploy-scripts/export"
REMOTE_EXPORT_DIR=""

## WordPress

### WordPress remote database name
REMOTE_DB_NAME=""

### WordPress remote database user
REMOTE_DB_USER=""

### WordPress remote database password
### Special characters must be escaped!
REMOTE_DB_PASS=""