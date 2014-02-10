var fs = require("fs");

eval(fs.readFileSync("./simpl.js")+'');

//simpl.setInput(fs.readFileSync("./initial.simpl")+"");
simpl.setInput(fs.readFileSync("./initial.simpl")+"");

var next = 0;
while (next !== 1){
    simpl.yy = false;
    next = simpl.next();
    console.log(next);
    
}
