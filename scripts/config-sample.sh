#!/bin/bash

# Local environmental variables

## Paths
### No leading slashes!

### Local project name for naming archives
### LOCAL_PROJECT_NAME="mbd-wp-deploy-scripts"

### Local root directory
### LOCAL_ROOT_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts"

### Directory to target when importing/exporting
### LOCAL_TARGET_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts/httpdocs"

### Directory where the imported archive can be found
### LOCAL_IMPORT_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts/import"

### Directory to output the archive
### LOCAL_EXPORT_DIR="c/xampp/htdocs/mbd-wp-deploy-scripts/export"

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
### REMOTE_PROJECT_NAME="mbd-wp-deploy-scripts"

### Remote root directory
### REMOTE_ROOT_DIR="home/markba/www/dev/mbd-wp-deploy-scripts"

### Directory to target when importing/exporting
### REMOTE_TARGET_DIR="home/markba/www/dev/mbd-wp-deploy-scripts/httpdocs"

### Directory where the imported archive can be found
### REMOTE_IMPORT_DIR="home/markba/www/dev/mbd-wp-deploy-scripts/import"

### Directory to output the archive
### REMOTE_EXPORT_DIR="home/markba/www/dev/mbd-wp-deploy-scripts/export"

## WordPress

### WordPress remote database name
REMOTE_DB_NAME=""

### WordPress remote database user
REMOTE_DB_USER=""

### WordPress remote database password
### Special characters must be escaped!
REMOTE_DB_PASS=""

# Domains
## No trailing slash
LOCAL_DOMAIN=""
REMOTE_DOMAIN=""