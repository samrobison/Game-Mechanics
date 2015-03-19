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

/*$(
	$("body").on("click",function(){
		$this = $(this);
		
		switch($this.attr("data-form-name")){
			case "Mechanic[examples][0]":
			console.log("works");
			break;
		}
	}));

*/
$(document).ready(function(){
    var lastClicked;
    $("div").click(function(){
        $this = $(this);

        //console.log($this);
        switch($this.attr("data-attr-name"))
        {
        	case "Mechanic[text]":
        	var text = document.getElementById("description");
        	//$this.addClass( "hidden" );
        	$this.hide();
        	text.className = text.className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
        	//text.children("textarea").height( $("textarea")[0].scrollHeight );

        	$("#description textarea").height("200px");
        	$("#description textarea").focus();
        	lastClicked = $(this)
        	break;

        	case "Mechanic[exapmles][0][text]":
			var text = document.getElementById("exampleText0");
			$this.addClass("hidden");
			text.className = text.className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			$("#exampleText0 textarea").css( "min-height", "300px" );
			$("#exampleText0 textarea").focus();
			break;

			case "Mechanic[exapmles][1][text]":
			var text = document.getElementById("exampleText1");
			$this.addClass("hidden");
			text.className = text.className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			break;

			case "Mechanic[exapmles][2][text]":
			var text = document.getElementById("exampleText2");
			$this.addClass("hidden");
			text.className = text.className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			break;

			case "Mechanic[exapmles][3][text]":
			var text = document.getElementById("exampleText3");
			$this.addClass("hidden");
			text.className = text.className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			break;

			case "Mechanic[exapmles][4][text]":
			var text = document.getElementById("exampleText4");
			$this.addClass("hidden");
			text.className = text.className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
			break;

        }
    });
    
    $("textarea").focusout(function() {
    	var text = $(this).text();
    	var parent = $(this).parent().attr("id");
    	//lastClicked.html() = text;
    	lastClicked.show();
    	$(this).hide();
    	//lastClicked.className = lastClicked.className.replace( /(?:^|\s)hidden(?!\S)/g , '' );
    	//lastClicked.text = text;
    	//$(this).addClass("hidden");

    	/*if(parent.indexOf("example") != -1)
    	{
    		//console.log($(this).parent().attr("id"));
    		if(parent.indexOf("Text") != -1)
    		{
    			var id = "[example]["+ parent.match(/\d+/g)+"][Text]";
    			//console.log(id);

    		}
    	}
    	else
    		console.log(parent.indexOf("example"));
		*/

  		//$(".btn").trigger( "click" );
  		//console.log($(".button"));
  });

});





