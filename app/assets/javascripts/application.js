// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function showExample(x)
{
	console.log("called");
	for (var i = 1; i < x; i++) 
	{
		var id ="example";
		id = id.concat(i);
		if (document.getElementById(id) != null && document.getElementById(id).className.match(/(?:^|\s)hidden(?!\S)/) )  
		{
			document.getElementById(id).className = document.getElementById(id).className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			break;
		}
		else if(x == i+1)
		{
			alert("Too Many Examples!!");
			break;
		
		}
	}
}

function showKeyword(x)
{
	for (var i = 1; i < x; i++) 
	{
		var id ="keyword";
		id = id.concat(i);
		if (document.getElementById(id) != null && document.getElementById(id).className.match(/(?:^|\s)hidden(?!\S)/) ) 
		{
			document.getElementById(id).className = document.getElementById(id).className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			break;
		}
		else if(x == i+1)
		{
			alert("Too Many Keywords!!");
			break;
		}
	}
}

function showNote(x)
{
	for (var i = 1; i < x; i++) 
	{
		var id ="note";
		id = id.concat(i);
		if (document.getElementById(id) != null && document.getElementById(id).className.match(/(?:^|\s)hidden(?!\S)/) ) 
		{
			document.getElementById(id).className = document.getElementById(id).className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			break;
		}
		else if(x == i+1)
		{
			alert("Too Many Notes!!");
			break;
		}
	}
}
