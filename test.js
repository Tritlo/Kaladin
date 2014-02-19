var fs = require("fs");

eval(fs.readFileSync("./kaladin.js")+'');

//kaladin.setInput(fs.readFileSync("./initial.kaladin")+"");
kaladin.setInput(fs.readFileSync("./initial.kal")+"");

var next = 0;
while (next !== 1){
    kaladin.yy = false;
    next = kaladin.next();
    console.log(next);
    
}
