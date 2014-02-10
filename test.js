var fs = require("fs");

eval(fs.readFileSync("./jeb.js")+'');

//jeb.setInput(fs.readFileSync("./initial.jeb")+"");
jeb.setInput(fs.readFileSync("./sec.jeb")+"");

var next = 0;
while (next !== 1){
    jeb.yy = false;
    next = jeb.next();
    console.log(next);
    
}
