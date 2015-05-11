'use strict';
module.exports = function(grunt) {

    // auto-load all grunt tasks matching the `grunt-*` pattern in package.json
    require('load-grunt-tasks')(grunt); // no need for grunt.loadNpmTasks!

    grunt.initConfig({
			pkg:    grunt.file.readJSON( 'package.json' ),
            plg1:   'mbd-safer-directory',
            plg2:   'mbd-safer-custom-functions',
            plg3:   'location-shortcode',
            plg4:   'load',
        
		 // watch for changes and trigger sass, jshint, uglify and livereload
        watch: {
            sass: {
					options: { 
						sourcemap: true 
					},
                files: ['sass/**/*.{scss,sass}'],
                tasks: [
					 	'sass', 
						'autoprefixer'
					]
            },
            js: {
                files: '<%= jshint.all %>',
                tasks: ['jshint']
            },
            livereload: {
                options: { livereload: true },
                files: [ 
                        'Gruntfile.js',
                        // Watch theme
					 	'httpdocs/wp-content/themes/<%= pkg.name %>/*.php', 
						'httpdocs/wp-content/themes/<%= pkg.name %>/lib/**/*.php', 
						'httpdocs/wp-content/themes/<%= pkg.name %>/style.css', 
						'httpdocs/wp-content/themes/<%= pkg.name %>/assets/js/source/**/*.js', 
						'httpdocs/wp-content/themes/<%= pkg.name %>/assets/images/**/*.{png,jpg,jpeg,gif,webp,svg}',
                        // Watch plugins
                        'httpdocs/wp-content/plugins/<%= plg1 %>/**/*',
                        // Watch mu-plugins
                        'httpdocs/wp-content/mu-plugins/<%= plg2 %>.php',
                        'httpdocs/wp-content/mu-plugins/<%= plg3 %>.php',
                        'httpdocs/wp-content/mu-plugins/<%= plg3 %>.php',
                ]
            }
        },
		


			// Modernizr
			modernizr: {
    			dist: {
        			// [REQUIRED] Path to the build you're using for development.
        			"devFile" : "bower_components/modernizr/modernizr.js",

        			// Path to save out the built file.
        			"outputFile" : "httpdocs/wp-content/themes/<%= pkg.name %>/assets/js/source/vendor/modernizr-custom.js",
		    	}

			},

        // sass
        sass: {
            dist: {
                options: {
                    sourcemap: true,
                    style: 'expanded',
                },
                files: {
                    'httpdocs/wp-content/themes/<%= pkg.name %>/style.css': 'sass/styles.scss',
                }
            }
        },

        // autoprefixer
        autoprefixer: {
            options: {
                browsers: ['last 2 versions', 'ie 9'],
                map: true
            },
            target_file: {
               src: 'httpdocs/wp-content/themes/<%= pkg.name %>/style.css',
            },
        },

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
		 	theme: {
        		options: {
            	prefix: 'Version\\:\\s'
        		},
        		src: [ 'sass/styles.scss' ],
   		   },
           plugin1: {
                options: {
                prefix: 'Version\\:\\s'
                },
                src: [ 'httpdocs/wp-content/plugins/<%= plg1 %>/<%= plg1 %>.php' ],
           },
           plugin2: {
                options: {
                prefix: 'Version\\:\\s'
                },
                src: [ 'httpdocs/wp-content/mu-plugins/<%= plg2 %>.php' ],
           },
           plugin3: {
                options: {
                prefix: 'Version\\:\\s'
                },
                src: [ 'httpdocs/wp-content/mu-plugins/<%= plg3 %>.php' ],
           },
          plugin4: {
                options: {
                prefix: 'Version\\:\\s'
                },
                src: [ 'httpdocs/wp-content/mu-plugins/<%= plg4 %>.php' ],
           },
		},


        // javascript linting with jshint
        jshint: {
            options: {
                jshintrc: '.jshintrc',
                "force": true
            },
            all: [
                'Gruntfile.js',
                'httpdocs/wp-content/themes/<%= pkg.name %>/assets/js/source/**/*.js'
            ]
        },



        // image optimization
        imagemin: {
            dist: {
                options: {
                    optimizationLevel: 7,
                    progressive: true,
                    interlaced: true
                },
                files: [{
                    expand: true,
                    cwd: 'httpdocs/wp-content/themes/<%= pkg.name %>/assets/images/',
                    src: ['**/*.{png,jpg,gif}'],
                    dest: 'httpdocs/wp-content/themes/<%= pkg.name %>/assets/images/'
                }]
            }
        },

		  // Copy the plugin to a versioned release directory
		  copy: {
			theme: {
				files:  [
					// includes files within path and its sub-directories
      			{expand: true, 
					cwd: 'httpdocs/wp-content/themes/<%= pkg.name %>/',
					src: [
						'**',
						'!style.css.map'
					], 
					dest: 'release/<%= pkg.name %>.<%= pkg.version %>/wp-content/themes/<%= pkg.name %>'},
					],
			},
            plg1: {
                files:  [
                    // includes files within path and its sub-directories
                {expand: true, 
                    cwd: 'httpdocs/wp-content/plugins/<%= plg1 %>/',
                    src: [
                        '**',
                        // '!style.css.map'
                    ], 
                    dest: 'release/<%= pkg.name %>.<%= pkg.version %>/wp-content/plugins/<%= plg1 %>'},
                    ],
            },
            plg2: {
                files:  [
                    // includes files within path and its sub-directories
                {expand: true, 
                    cwd: 'httpdocs/wp-content/mu-plugins/',
                    src: [
                        '<%= plg2 %>.php',
                        // '!style.css.map'
                    ], 
                    dest: 'release/<%= pkg.name %>.<%= pkg.version %>/wp-content/mu-plugins'},
                    ],
            },
            plg3: {
                files:  [
                    // includes files within path and its sub-directories
                {expand: true, 
                    cwd: 'httpdocs/wp-content/mu-plugins/',
                    src: [
                        '<%= plg3 %>.php',
                        // '!style.css.map'
                    ], 
                    dest: 'release/<%= pkg.name %>.<%= pkg.version %>/wp-content/mu-plugins'},
                    ],
            },
            plg4: {
                files:  [
                    // includes files within path and its sub-directories
                {expand: true, 
                    cwd: 'httpdocs/wp-content/mu-plugins/',
                    src: [
                        '<%= plg4 %>.php',
                        // '!style.css.map'
                    ], 
                    dest: 'release/<%= pkg.name %>.<%= pkg.version %>/wp-content/mu-plugins'},
                    ],
            },

			font_awesome: {
				 expand: true,
				 flatten: true,
				 src: ['bower_components/fontawesome/fonts/*'],
				 dest: 'httpdocs/wp-content/themes/<%= pkg.name %>/assets/fonts'
			}
		},

		clean: {
			main: ['release/<%= pkg.name %>.<%= pkg.version %>']
		},

		compress: {
			main: {
				options: {
					mode: 'zip',
					archive: 'release/<%= pkg.name %>.<%= pkg.version %>/wp-content.zip'
				},
				expand: true,
				cwd: 'release/<%= pkg.name %>.<%= pkg.version %>/wp-content',
				src: ['**/*'],
				dest: 'wp-content/'
			}		
		},

    });

  // Load tasks 
  grunt.loadNpmTasks('grunt-wordpress-deploy');

    // register tasks

    grunt.registerTask('default', [
	 	'sass', 
		'modernizr',		
		'watch'
	]);
    grunt.registerTask('copyassets', [
        'copy:theme',
        'copy:plg1',
        'copy:plg2',
        'copy:plg3',
        'copy:plg4',
    ]);
	grunt.registerTask('build', [
		'bump',
		'version',
        'autoprefixer',
        'sass', 
        'modernizr',
        'copyassets',
         'compress',
        'watch'
	]);
	
	// Copy assets from bower_components to theme dir
	grunt.registerTask('copybower', [
		'copy:font_awesome'
	]);	

};
