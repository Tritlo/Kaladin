function lex (){
    var t = $("#input").val();
    console.log(t);
    simpl.setInput(t);
    var next = 0;
    var output = [];
    var matches = [];
    while(next !== 1){
	this.yy = false;
	next = simpl.lex();
	if(next && next !== "T" && next !== "NL"){
	    var match = simpl.match;
	    output.push(next);
	    matches.push(match);
	}
   }
    $("#out").empty();
    //$("#out").append("<ul class='list-group'>");
    var current;
    var list;
    var currents =[];
    for(var i=0; i < output.length;i++){
	//if (i % 2 ==0){
	    list = $("<ul class='list-group'>");
            current = $("<div class='col-sm-4'>");
	    
	 //   }
	list.append("<li class='list-group-item'><div class='panel panel-primary'><div class='panel-heading'>"  + output[i] + "</div><div class='panel-body'>" + matches[i]  +"</div></div></li>");
	//if (i% 2 ==1){
	    current.append(list);
	    currents.push(current);
	//}
    }
    for (cur in currents){
	$("#out").append(currents[cur]);
    }
    
}



$(document).ready(function (){
    $.get("initial.simpl",success=function(data){$("#input").val(data)});
    $("#lex").click(function(evt){lex();});
});
