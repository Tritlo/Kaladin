function lex (){
    var t = $("#program").val();
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

var tooutput = [];
var debug = console.log;
emit = function(s){
    tooutput.push(s);
};

function parse(){
    tooutput = [];
    $("#output").val("");
    p = kaladin.parse($("#program").val());
    $("#output").val(tooutput.join("\n"));
    $("#download").click(function () {
            window.open("data:application/javascript;charset=utf-8;base64,"+Base64.encode($("#output").val()));
        }).removeAttr('disabled');
    //if (p){
	//alert("Parsing successful!");
    //};
};

function errorfunc(e){
    $("#output").val(e);
};

$(document).ready(function (){
    $.get("initial.kal",success=function(data){$("#program").val(data);});
    $("#lex").click(function(evt){lex();});
    $("#parse").click(function(evt){parse();});
    window.onerror = errorfunc;
});
