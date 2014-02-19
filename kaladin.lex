/* lexical grammar */
%options flex case-insensitive
%lex
%%
^\#.*                    return '#';
\n                       return "l";
\t                       return "t";
\s                       return "w";
"while"                  return "W";
"if"                     return "I";
"then"                   return "T";
"else"                   return "E";
"and"                    return "&";
"or"                     return "|";
"not"                    return "!";
"is"                     return "=";
"true"                   return "1";
"false"                  return "0";
"in"                     return "e";
"["                      return "[";
"]"                      return "]";
"_"                      return "_";
"("                      return "(";
")"                      return ")";
"{"                      return "{";
"}"                      return "}";
"nil"                    return "N";
\"[^\"]*\"               return "s";
[0-9]+("."[0-9]+)?\b     return "n";
[A-Za-z]([A-Za-z0-9])*   return "i";
"="                      return "d";
"^"                      return '^';
"*"                      return '*';
"/"                      return '/';
"-"                      return '-';
"+"                      return '+';
"$"                      return "$";
\:                       return ":";
\;                       return ";";
[\<\>][\=]?              return "c";                 
<<EOF>>                  return 'F';

/lex
%left '+' '-'
%left '*' '/'
%right "n"

%start expressions

%token name "i"
%token if "I"
%token then "T"
%token else "E"
%token while "W"
%token num "n"
%token str "s"
%token op "*" "+" "-" "^" "/"

%% //grammar %%
expressions: program EOF { return $1};

program : function
        | function program;

//Functions only take in one argument,
//otherwise we get a whole bunch of conflicts
function: name name "=" funcdecl
        | name "=" funcexpr;


funcexpr: "{" body "}";

funcdecl: funcexpr | expr;

decl: name "=" expr;

exprdelim: ";" | "l";

body: expr exprdelim | expr;

//do: funcexpr | expr;
do: funcexpr;


ifwhile: if | while;
cond:  expr ;
flowexpr: ifwhile cond then do else do;

names: name | names;

list: "[" "]" | "[" names "]";
lit:  num | str;
//funcappl: name "(" names ")";
funcappl: "$" name name;


expr: name
| funcappl
| decl
| lit
| op expr
| "(" expr ")"
| "(" expr op expr")"//Verdum ad hafa, annars faum vid conflict
| flowexpr;
%%
