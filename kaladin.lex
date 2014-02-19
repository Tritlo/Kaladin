/* lexical grammar */
%options flex case-insensitive
%lex
%%
^\#.*                    return  false;
\n                       return "l";
\t                       return "t";
\s                       return false;
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
"["                      return "[";
"]"                      return "]";
"_"                      return "_";
"("                      return "(";
")"                      return ")";
"{"                      return "{";
"}"                      return "}";
"nil"                    return "N";
"="                      return "=";
"^"                      return '^';
"*"                      return '*';
"/"                      return '/';
"-"                      return '-';
"+"                      return '+';
"$"                      return "$";
","                      return ",";
\:                       return ":";
\;                       return ";";
"in"                     return "c";
[\<\>][\=]?              return "c";
\"[^\"]*\"               return "s";
[0-9]+("."[0-9]+)?\b     return "n";
[A-Za-z]([A-Za-z0-9])*   return "i";

<<EOF>>                  return 'EOF';

/lex
%left '+' '-'
%left '*' '/'

%start expressions


%% //grammar %%
expressions: program EOF;

name: "i";
if: "I";
then: "T";
else: "E";
while: "W";
num: "n";
str: "s";
op: "*" | "+"| "-"| "^"| "/";
nil: "N";

program : function
        | function program
        | "l" program
        | exprdelim;

//Functions only take in one argument,
//otherwise we get a whole bunch of conflicts
function: name name "=" funcdecl
        | name "=" funcexpr;

funcexpr: "{" body "}";

funcdecl: funcexpr | expr;

decl: name "=" expr;

exprdelim: ";" | "l";

body: expr exprdelim body | expr exprdelim | expr | "{" body "}" | "l" body;

//do: funcexpr | expr;

do: funcdecl;
ifwhile: if | while;
bool:  "&" | "|" | "!";
cond:  expr | "(" cond bool cond ")" | bool "(" cond ")";
flowexpr: ifwhile cond then do else do;

names: name | lit | name "," names | lit "," names;
list: "[" "]" | "[" names "]";
lit:  num | str | list | "1" | "0";
funcappl:  "$" name  expr;
//exprs: expr | expr "," exprs;

expr: name
| nil
| funcappl
| decl
| lit
| op expr
| "(" expr ")"
| "(" expr expr ")"
| "(" expr "c" expr")"//Verdum ad hafa, annars faum vid conflict
| flowexpr;
%%
