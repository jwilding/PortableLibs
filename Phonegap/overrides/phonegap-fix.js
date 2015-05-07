#!/usr/bin/env node

// this plugin replaces arbitrary text in arbitrary files
//
// Look for the string CONFIGURE HERE for areas that need configuration
//

var fs = require('fs');
var path = require('path');

var rootdir = "./";

function replace_string_in_file(filename, to_replace, replace_with)
{
    var data = fs.readFileSync(filename, 'utf8');

    var result = data.replace(new RegExp(to_replace, "g"), replace_with);
    fs.writeFileSync(filename, result, 'utf8');
}

//if (rootdir)
{
    var filestoreplace = [
        // android
        "node_modules/phonegap/node_modules/cordova/node_modules/cordova-lib/src/cordova/metadata/android_parser.js"
    ];
	
	//console.log("Running: " + rootdir);
	
    filestoreplace.forEach(
		function(val, index, array)
		{
			var fullfilename = path.join(rootdir, val);
			if (fs.existsSync(fullfilename))
			{
				console.log("Replacing: " + fullfilename);
				replace_string_in_file(fullfilename, "'screen.png'", "'splash.png'");
			}
			else
			{
				console.log("Missing: " + fullfilename);
			}
		}
	);

}
