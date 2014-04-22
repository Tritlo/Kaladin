
/* lexical grammar */
%options flex case-insensitive
%lex
%%
^\#.*                    return false;
//\n                       return false;
//\t                       return false;
\s                       return false;
"function"               return "DEF";
"While"                  return "WHILE";
"while"                  return "WHILE";
"If"                     return "IF";
"if"                     return "IF";
"else"                   return "ELSE";
"and"                    return "AND";
"or"                     return "OR";
"not"                    return "NOT";
", whose arguments are"                    return "ARGSDECL";
", whose argument is"                    return "ONEARGDECL";
", which takes no arguments"                    return "NOARGSDECL";
", is as follows:"                    return "FUNCDECLEND";
"true"                   return "TRUE";
//"and return "                   return "ANDRET";
"True"                   return "TRUE";
"false"                  return "FALSE";
"False"                  return "FALSE";
"Return"                 return "RETURN";
"return"                 return "RETURN";
"We let"                    return "VAR";
"we let"                    return "VAR";
"Let"                    return "LET";
"let"                    return "LET";
"then"                   return "THEN"
"The"                    return "THE";
"the"                    return "THE";
"Do"                    return "DO";
"do"                    return "DO";
"None"                   return "NONE";
"in"                     return "IN";
"be"                      return "=";
"which is what we wanted to do."                      return 'EXPRDELIM';
"is less than or equal to"                       return "<=";
"is greater than or equal to"                       return ">=";
"is less than"                       return "<";
"is greater than"                       return ">";
"is"                     return "==";
", and"                      return ",";
"("                     return "(";
")"                     return ")";
"=="                     return "==";
"="                      return "=";
//"**"                      return '^';
"*"                      return '*';
"/"                      return '/';
"++"                     return '++';
"-"                      return '-';
"+"                      return '+';
","                      return ",";
\"[^\"]*\"               return "STRING";
\'[^\']*\"               return "STRING";
[A-Za-z]([A-Za-z0-9])*   return "NAME";
[0-9]+("."[0-9]+)?\b     return "NUMBER";
\:                       return "THEN";
\;                       return "EXPRDELIM";
\.                       return "EXPRDELIM";

<<EOF>>                  return 'EOF';

/lex

%token EOF
%token DEC
%token INC
%token DEF
%token VAR
%token WHILE
%token IF
%token IS 
%token IN
%token OR
%token AND
%token NOT
%token NONE
%token NAME
%token NUMBER
%token STRING
%token TRUE
%token FALSE
%token RETURN
%token ELSE
%token ELSEIF
%token EXPRDELIM
%token THE
%token ARGSDECL
%token NOARGSDECL
%token ONEARGDECL
%token FUNCDECLEND
%token THEN
%token LET
%token DO 


%right RETURN
%left NOT
%left OR
%left AND
%left '<=' '>=' '<' '>' '==' 
%right '='
%left '++'
%left '+', '-'
%left '*', '/'
//%left '^'
%left UMINUS


%start kaladin


%%


kaladin: program EOF { postparse();};


//jison does not have mid-rule actions.
program: functions;

functions: functions function EXPRDELIM
	 | function EXPRDELIM;


posArgDecl: NOARGSDECL {{ $$ = []; }}
          | ARGSDECL names {{ $$ = $2;}}
          | ONEARGDECL NAME {{ $$ = [$2];}};

function: THE NAME DEF posArgDecl FUNCDECLEND  optdecls optexprs
%{
 var funname = $2;
 var funargs = $4;
 var decls = $6;
 var exprs = $7;
 fun = {
    args: funargs,
    decls: decls,
    exprs: exprs
 }; 
 functions[funname] = fun

%};


names: names ',' NAME {$1.push($3); $$ = $1;} 
     | NAME {$$ = [$1]};

optnames: /* empty */	{$$ = []}
        | names;


args: args ',' expr  {$1.push($3); $$ =$1;}
    | expr {$$ = [$1]};

optargs:  /* empty */{$$ = []}
       | args;

body: exprlist { $$ = {"exprs": $1}};

decl: VAR NAME "=" expr { $$ = {"name": $2, "expr" : $4}};


optdecls:  /* empty */ { $$ = [] }
        | decls;

decls: decls decl EXPRDELIM {$1.push($2); $$ = $1;}
     | decl EXPRDELIM {$$ = [$1] };


		    
exprlist: exprlist ',' expr  {$1.push($3); $$ =$1;}
        | expr {$$ = [$1]};

ifrest://		  /* empty */ { $$ = null }
ELSE body  { $$ = { "type": "ELSE", "body" : $2, "rest": null}};

ifst: IF  expr THEN body ifrest EXPRDELIM
%{ 
$$ = {"type": "IF", "cond": $2, "body": $4, "rest": $5} 
%};

whilest: WHILE  expr THEN body EXPRDELIM
%{ 
$$ = {"type": "WHILE", "cond": $2, "body": $4};
%};



expr: expr '+' expr             { $$ = {OP: "+", "type": "OP","subexprs": [$1,$3]}}
    | expr '-' expr             { $$ = {OP: "-", "type": "OP","subexprs": [$1,$3]}}
    | expr '*' expr             { $$ = {OP: "*", "type": "OP","subexprs": [$1,$3]}}
    | expr '/' expr             { $$ = {OP: "/", "type": "OP","subexprs": [$1,$3]}}
    //| expr '^' expr             { $$ = {OP: "**", "type": "OP","subexprs": [$1,$3]}}
    | '-' expr %prec UMINUS     { $$ = {OP: "-", "type":"OP", "subexprs": [$2]}}
    | expr '<=' expr            { $$ = {OP: "<=", "type": "OP","subexprs": [$1,$3]}}
    | expr '>=' expr            { $$ = {OP: ">=", "type": "OP","subexprs": [$1,$3]}}
    | expr '<' expr             { $$ = {OP: "<",  "type": "OP","subexprs": [$1,$3]}}
    | expr '>' expr             { $$ = {OP: ">",  "type": "OP","subexprs": [$1,$3]}}
    | expr '==' expr            { $$ = {OP: "==", "type": "OP","subexprs": [$1,$3]}}
    | expr "++" expr            { $$ = {OP: "++", "type": "OP","subexprs": [$1,$3]}}
    | NAME '(' optargs ')'      { $$ = {OP: $1, "type": "OP", "subexprs": $3}}
    | DO NAME '(' optargs ')'   { $$ = {OP: $2, "type": "OP", "subexprs": $4}}
    | expr AND expr             { $$ = {type: "AND", "subexprs": [$1,$3]}}
    | expr OR expr              { $$ = {type: "OR", "subexprs": [$1,$3]}}
    | NOT expr                  { $$ = {type: "NOT", "val": $2}}
    | LET NAME '=' expr         { $$ = {type: "STORE", name: $2, val: $4 }}
    | NAME '=' expr             { $$ = {type: "STORE", name: $1, val: $3 }}
    | NAME                      { $$ = {type: "NAME", "name": $1}}
    | RETURN expr               { $$ = {type: "RETURN", "val": $2}}
    | NONE                      { $$ = {type: "LITERAL", "val": "null"}}
    | STRING                    { $$ = {type: "LITERAL", "val": $1}}
    | NUMBER                    { $$ = {type: "LITERAL", "val": $1}}
    | TRUE                      { $$ = {type: "LITERAL", "val": $1}}
    | FALSE                      { $$ = {type: "LITERAL", "val": $1}}
    | '(' expr ')'              { $$ = {type: "()", "val": $2}}
    | ifst 
    | whilest;


exprs: exprs expr EXPRDELIM {$1.push($2); $$ = $1;}
     | expr EXPRDELIM { $$ = [$1] };

optexprs:  /* empty */ { $$ = [] }
     | exprs;

%%

var name = "initial"; 

var numexpressions = 0;
var numfunctions = 0;
var numdecls = 0;
var startTime = Date.now()
if(this.process !== undefined){
  var fs = require('fs');
  var toEmit = ""
  var emit = function(x){
   toEmit += x.toString();
   toEmit += "\n";
  };
  //var emit = console.log;
  var debug =  console.log; 
  name =  this.process.argv[2].split(".")[0];
} else {
  emit = window.emit || console.log;
  debug = window.debug || console.log;
}
var functions = {};

var postparse = function(){
  console.log("Parsing complete");
  var parseDone = Date.now()
  createProgram();
  var codeGenDone = Date.now()
  if(this.process !== undefined){
    fs.writeFile(name+".masm",toEmit,function(err){ 
    if(err) throw err;
    console.log("Output written to "+name+".masm");
    console.log();
    console.log("Stats: ");
    console.log("Expressions: "+numexpressions);
    console.log("Functions: "+numfunctions);
    console.log("Declerations: "+numdecls);
    console.log("Lines of code generated: "+ toEmit.split("\n").length);
    console.log();
    console.log("Performance: ");
    console.log("Parse time: "+ (parseDone - startTime)/1000);
    console.log("Code generation time: "+ (codeGenDone - parseDone)/1000);
    console.log("Total time: "+ (codeGenDone-startTime)/1000);
    });
  }
}


function generateExpr(expr,exprtype){
  numexpressions += 1;
  if(!exprtype) exprtype = "";
  var type = expr["type"];
  if(genExprType[type]) genExprType[type](expr,exprtype);
  else debug(type);
};

function generateBody(body,exprtype){
  if(!exprtype) exprtype = "";
  var exprs = body.exprs;
  for(var i = 0; i < exprs.length; i++){
    if(i == exprs.length -1) generateExpr(exprs[i],exprtype);
    else generateExpr(exprs[i]);
  };
};

var convTable = {};

genExprType = {
  "OP": function (expr,exprtype){
	    var op = expr["OP"]; 
	    var args = expr.subexprs;
	    for(var i = 0; i < args.length; i++){
	      if(i == 0) generateExpr(args[i],exprtype);
              else generateExpr(args[i],"P");
	    };
            if(exprtype !=="R"){ exprtype = "";}
	    emit('(Call'+exprtype+' #"'+op+'[f'+args.length+']" ' + args.length +')');
	},
  "NOT": function(expr,exprtype){
	    var args = expr.subexprs;
	    generateExpr(args[0]);
	    emit('(Not' +exprtype+')');
	},
  "LITERAL": function(expr,exprtype){
           if(convTable[expr.val]) expr.val = convTable[expr.val];
           emit("(MakeVal"+exprtype+" " + expr.val +")");
	},
  "NAME": function(expr,exprtype){
           var loc = nameTable[expr.name];
           emit("(Fetch"+exprtype+" " + loc +")");
	},
  "RETURN": function(expr,exprtype){
           generateExpr(expr.val,"");
           emit("(Return)");
	},
  "()": function(expr,exprtype){
           generateExpr(expr.val,"");
	},
  "STORE": function(expr,exprtype){
           generateExpr(expr.val,"");
           var loc = nameTable[expr.name];
           emit("(Store"+exprtype+" " + loc +")");
	},
  "AND": function(expr,exprtype){
         if(exprtype === "P") emit("(Push)");
         generateExpr(expr.subexprs[0],"");
         var labEnd = newLab();
         emit("(GoFalse _" + labEnd +")");
         generateExpr(expr.subexprs[1],"");
         emit("_" + labEnd +":");
         if(exprtype === "R") emit("(Return)");
      },
  "OR": function(expr,exprtype){
         if(exprtype === "P") emit("(Push)");
         generateExpr(expr.subexprs[0],"");
         var labEnd = newLab();
         emit("(GoTrue _" + labEnd +")");
         generateExpr(expr.subexprs[1],"");
         emit("_" + labEnd +":");
         if(exprtype === "P") emit("(Return)");
      },
  "IF": function(expr,exprtype){
         generateExpr(expr.cond,"");
         var labElse = newLab();
         var labEnd = newLab();
         var temp = expr.rest;
         if(temp){
	    emit("(GoFalse _" + labElse +")");
	    generateBody(expr.body,exprtype);
	    emit("(Go _" + labEnd +")");
         } else {
	    emit("(GoFalse _" + labEnd +")");
	    generateBody(expr.body,exprtype);
	 };
         while(temp){
             emit("_" + labElse +":");
	     if(temp.rest&& temp.rest.cond){
		 labElse = newLab();
		 generateExpr(temp.cond,"");
		 emit("(GoFalse _" + labElse +")");
	     };
             generateBody(temp.body,exprtype);
             emit("(Go _" + labEnd +")");
	     temp = temp.rest;
	 };
         emit("_" + labEnd +":");
	},

  "WHILE": function(expr,exprtype){
         if(exprtype === "P") emit("(Push)");
         var labStart = newLab();
         var labEnd = newLab();
         emit("_" + labStart +":");
         generateExpr(expr.cond,"");
         emit("(GoFalse _" + labEnd +")");
         generateBody(expr.body);//,exprtype);
         emit("(Go _" + labStart +")");
         emit("_" + labEnd +":");
         if(exprtype === "R") emit("(Return)");
      }
   };



var nameTable = {};
function generateDecl(decl){
 numdecls += 1;
 //if(nameTable[decl.name] === undefined){
 nameTable[decl.name] = newLoc();
 // } else {console.log("Warning!");}
 emit("(Push)");

 var loc = nameTable[decl.name];
 generateExpr(decl.expr,"");
 emit("(Store " + loc +")");
};

var currentLab = 0;

function newLab(){
    return currentLab++;
};

function newLoc(){
    return namesInTable++;
};

function generateFunction(funcname, funcobj){
  numfunctions += 1;
  //debug(funcobj);
  var args = funcobj.args;
  var decls = funcobj.decls;
  var exprs = funcobj.exprs;
  emit('#"'+funcname+'[f'+args.length+']" = ');
  emit("[");
  nameTable = {};
  namesInTable = 0;
  //emit("(MakeVal null)");
  //emit("(Push)");
  for(arg in args){
     var name =  args[arg];
     nameTable[name] = namesInTable++;
  };
  //We don't have closures, and no top level 
  //Variables.
  for(var i = 0; i < decls.length; i++){
      generateDecl(decls[i]);
  };
  for(var i = 0; i < exprs.length; i++){
    generateExpr(exprs[i]);
  };
  emit("(Return)");
  emit("];");
};

var createProgram = function (){
  emit('"'+name+'.mexe" = main in '); 
  emit('!{{'); 
  for(func in functions){
    //debug(func, functions[func]);
    generateFunction(func,functions[func]);
  }
  emit("}}*BASIS;");
};
