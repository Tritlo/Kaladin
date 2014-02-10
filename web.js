function lex (){
    var t = $("#input").val();
    simpl.setInput(t);
    var next = 0;
    var match = "";
    var current;
    var list;
    $("#out").empty();
    
    while(next !== 1){
	this.yy = false;
	next = simpl.lex();
	if(next && next !== "T" && next !== "NL"){
	    match = simpl.match;
	    list = $("<ul class='list-group'>");
            current = $("<div class='col-sm-4'>");
	    list.append("<li class='list-group-item'><div class='panel panel-primary'><div class='panel-heading'>"  + next + "</div><div class='panel-body'>" +match  +"</div></div></li>");
	    current.append(list);
	   $("#out").append(current);
	}
   }
    
}



$(document).ready(function (){
    $.get("initial.simpl",success=function(data){$("#input").val(data)});
    $("#lex").click(function(evt){lex();});
});
