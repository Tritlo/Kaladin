function lex (){
    var t = $("#input").val();
    kaladin.lexer.setInput(t);
    var next = 0;
    var match = "";
    var current;
    var list;
    $("#out").empty();
    
    while(next !== 1){
	this.yy = false;
	next = kaladin.lexer.lex();
	if(next && next !== "l" && next !== "t" && next !== "w"){
	    match = kaladin.lexer.match;
	    list = $("<ul class='list-group'>");
            current = $("<div class='col-sm-4'>");
	    list.append("<li class='list-group-item'><div class='panel panel-primary'><div class='panel-heading'>"  + next + "</div><div class='panel-body'>" +match  +"</div></div></li>");
	    current.append(list);
	   $("#out").append(current);
	}
   }
    
}

function parse(){
    p = kaladin.parse($("#input").val());
    if (p){
	alert("Parsing successful!");
    };
};


$(document).ready(function (){
    $.get("initial.kal",success=function(data){$("#input").val(data);});
    $("#lex").click(function(evt){lex();});
    $("#parse").click(function(evt){parse();});
    window.onerror = alert;
});
