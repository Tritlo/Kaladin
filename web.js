function lex (){
    var t = $("#input").val();
    console.log(t);
    jeb.setInput(t);
    var next = 0;
    var output = [];
    while(next !== 1){
	this.yy = false;
	next = jeb.next();
	output.push(next);
	console.log(next);
   }
    $("#out").empty();
    //$("#out").append("<ul class='list-group'>");
    var current = $("<div class='span6'>");
    var list;
    var currents =[];
    for(var i=0; i < output.length;i++){
	if (i % 6 ==0){
	    list = $("<ul class='list-group'>");
            current = $("<div class='col-sm-4'>");
	    
	    }
	list.append("<li class='list-group-item'>"+output[i]+"</li>");
	if (i% 5 ==0){
	    current.append(list);
	    currents.push(current);
	}
    }
    for (cur in currents){
	$("#out").append(currents[cur]);
    }
    
}



$(document).ready(function (){
    $.get("initial.jeb",success=function(data){$("#input").val(data)});
    $("#lex").click(function(evt){lex();});
});
