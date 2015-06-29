# MBD WP Deploy Scripts

## By Mark Bain Design

### Version 0.0.23

#### 1. Description

Just some scripts to automate the process of moving WordPress installs from local to remove environments. 

#### 2. Set up

* Clone the repo into the root of your project directory.
* Upload the `scripts`dir.
* Create the following directories in the root of your local/remote projects:
* * `/import`
* * `/export`

#### 3. Usage

* Make copies of all `-sample` files with you own project variables and data, removing the suffix.
* IMPORTANT: Add `config.sh` to your project `.gitignore`. This file contains sensitive data and, once added to a repo, can never truly be deleted!
* Copy `config.sh`and all `remote-`files to your remote server.
* IMPORTANT: The `-import`scripts delete existing files. Always make a backup before you run these!!!
* Run the scripts from the scripts dir when required.

#### Updating to latest version
If you use NPM to manage project dependencies, you can add the Github repo to `package.json`. 

`"scripts": "markbaindesign/mbd-wp-deploy-scripts"`

To get the latest version, run 

`npm update scripts`

The version will be updated in your `node_modules`directory. Files may need to also be copied elsewhere. 

- Don't forget to also update the script files on the remote server! _
