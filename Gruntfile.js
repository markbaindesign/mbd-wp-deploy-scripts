'use strict';
module.exports = function(grunt) {

    // auto-load all grunt tasks matching the `grunt-*` pattern in package.json
    require('load-grunt-tasks')(grunt); // no need for grunt.loadNpmTasks!

    grunt.initConfig({
			pkg:    grunt.file.readJSON( 'package.json' ),
            rdm:   'README.md',
        

        // Bump up the version number in package.json
	  	bump: {
			options: {
  			updateConfigs: ['pkg'], // make sure to check updated pkg variables
  			createTag: false,
  			push: false,
			}
		},

		 // Copy the version number from package.json to the following:
		 version: {
		 	readme: {
        		options: {
            	prefix: 'Version\\ \\s'
        		},
        		src: [ '<%= rdm %>' ],
   		   }
		},

    });

    // register tasks

	grunt.registerTask('default', [
		'bump',
		'version'
	]);
};