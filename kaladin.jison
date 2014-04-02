
/* lexical grammar */
%options flex case-insensitive
%lex
%%
^\#.*                    return false;
//\n                       return false;
//\t                       return false;
\s                       return false;
"def"                    return "DEF";
"while"                  return "WHILE";
"if"                     return "IF";
"else if"                return "ELSEIF";
"else"                   return "ELSE";
"and"                    return "AND";
"or"                     return "OR";
"not"                    return "NOT";
"true"                   return "TRUE";
"false"                  return "FALSE";
"return"                 return "RETURN";
"var"                    return "VAR";
"["                      return "[";
"]"                      return "]";
"("                      return "(";
")"                      return ")";
"{"                      return "{";
"}"                      return "}";
"None"                   return "NONE";
"in"                     return "IN";
"is"                     return "IS";
"=="                     return "==";
"="                      return "=";
"^"                      return '^';
"*"                      return '*';
"/"                      return '/';
"++"                     return 'INC';
"--"                     return 'DEC';
"-"                      return '-';
"+"                      return '+';
","                      return ",";
\:                       return ":";
\;                       return ";";
"<="                       return "<=";
">="                       return "<=";
"<"                       return "<=";
">"                       return "<=";
\"[^\"]*\"               return "STRING";
[0-9]+("."[0-9]+)?\b     return "NUMBER";
[A-Za-z]([A-Za-z0-9])*   return "NAME";

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

%right RETURN
%left NOT
%left OR
%left AND
%left '<=' '>=' '<' '>' '==' 
%right '='
%left '+', '-'
%left '*', '/'
%left '^'
%left UMINUS


%start kaladin


%%


kaladin: program EOF { postparse();};


//jison does not have mid-rule actions.
program: functions;

functions: functions function ';'
	 | function ";";


function: DEF NAME '(' optnames ')' '{' optdecls optexprs '}'
%{
 var funname = $2;
 var funargs = $4;
 var decls = $7;
 var exprs = $8;
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

body: '{' optexprs '}' { $$ = {"exprs": $2}};

decl: VAR NAME "=" expr { $$ = {"name": $2, "expr" : $4}};


optdecls:  /* empty */ { $$ = [] }
        | decls;

decls: decls decl ';' {$1.push($2); $$ = $1;}
     | decl ';' {$$ = [$1] };


ifrest:  /* empty */ { $$ = null }
| ELSE body  { $$ = { "type": "ELSE", "body" : $2, "rest": null}}
| ELSEIF  '(' expr ')' body ifrest
 { $$ = { "type": "ELSEIF", "cond": $3, "body" : $5, "rest": $6} };

ifst: IF '(' expr ')' body ifrest  
%{ 
$$ = {"type": "IF", "cond": $3, "body": $5, "rest": $6} 
%};

whilest: WHILE '(' expr ')' body
%{ 
$$ = {"type": "WHILE", "cond": $3, "body": $5};
%};



expr: expr '+' expr             { $$ = {OP: "+", "type": "OP","subexprs": [$1,$3]}}
    | expr '-' expr             { $$ = {OP: "-", "type": "OP","subexprs": [$1,$3]}}
    | expr '*' expr             { $$ = {OP: "*", "type": "OP","subexprs": [$1,$3]}}
    | expr '/' expr             { $$ = {OP: "/", "type": "OP","subexprs": [$1,$3]}}
    | expr '^' expr             { $$ = {OP: "^", "type": "OP","subexprs": [$1,$3]}}
    | '-' expr %prec UMINUS     { $$ = {OP: "-", "type":"OP", "subexprs": [$1]}}
    | expr '<=' expr            { $$ = {OP: "<=", "type": "OP","subexprs": [$1,$3]}}
    | expr '>=' expr            { $$ = {OP: ">=", "type": "OP","subexprs": [$1,$3]}}
    | expr '<' expr             { $$ = {OP: "<",  "type": "OP","subexprs": [$1,$3]}}
    | expr '>' expr             { $$ = {OP: ">",  "type": "OP","subexprs": [$1,$3]}}
    | expr '==' expr            { $$ = {OP: "==", "type": "OP","subexprs": [$1,$3]}}
    | NAME '(' optargs ')'      { $$ = {OP: $1, "type": "OP", "subexprs": $3}}
    | expr AND expr             { $$ = {type: "AND", "subexprs": [$1,$3]}}
    | expr OR expr              { $$ = {type: "OR", "subexprs": [$1,$3]}}
    | NOT expr                  { $$ = {type: "NOT", "val": $2}}
    | NAME '=' expr             { $$ = {type: "STORE", name: $1, val: $3 }}
    | NAME                      { $$ = {type: "NAME", "name": $1}}
    | RETURN expr               { $$ = {type: "RETURN", "val": $2}}
    | NONE                      { $$ = {type: "LITERAL", "val": $1}}
    | STRING                    { $$ = {type: "LITERAL", "val": $1}}
    | NUMBER                    { $$ = {type: "LITERAL", "val": $1}}
    | '(' expr ')'              { $$ = {type: "()", "val": $2}}
    | ifst 
    | whilest;


exprs: exprs expr ';' {$1.push($2); $$ = $1;}
     | expr ';' { $$ = [$1] };

optexprs:  /* empty */ { $$ = [] }
     | exprs;

%%

var name = "initial"; 

if(this.process !== undefined){
  var emit = console.log;
  var debug =  console.log; 
  name =  this.process.argv[2].split(".")[0];
} else {
  console.log(emit);
  emit = window.emit || console.log;
  debug = window.debug || console.log;
}
var functions = {};

var postparse = function(){
  console.log("parsing complete");
  createProgram();
}


function generateExpr(expr,exprtype){
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
  "IF": function(expr,exprtype){
         generateExpr(expr.cond,"");
         var labElse = newLab();
         var labEnd = newLab();
         emit("(GoFalse " + labElse +")");
         generateBody(expr.body,exprtype);
         emit("(Go " + labEnd +")");
         var temp = expr.rest;
         while(temp){
             emit("(_" + labElse +")");
	     if(temp.cond){
		 labElse = newLab();
		 generateExpr(temp.cond,"");
		 emit("(GoFalse " + labElse +")");
	     };
             generateBody(temp.body,exprtype);
             emit("(Go " + labEnd +")");
	     temp = temp.rest;
	 };
         emit("(_" + labEnd +")");
	},

  "WHILE": function(expr,exprtype){
         var labStart = newLab();
         var labEnd = newLab();
         emit("(_" + labStart +")");
         generateExpr(expr.cond,"");
         emit("(GoFalse " + labEnd +")");
         //Here we ignore exprtype, as it migth lead to strange bugs.
         generateBody(expr.body);//,exprtype);
         emit("(Go " + labStart +")");
         emit("(_" + labEnd +")");
      }
   };



var nameTable = {};
function generateDecl(decl){
 if(nameTable[decl.name] === undefined)
     nameTable[decl.name] = newLoc();

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
  //debug(funcobj);
  var args = funcobj.args;
  var decls = funcobj.decls;
  var exprs = funcobj.exprs;
  emit('#"'+funcname+'[f'+args.length+']" = ');
  emit("[");
  nameTable = {};
  namesInTable = 0;
  //emit("(MakeVal null)");
  emit("(Push)");
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
