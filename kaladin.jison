/* lexical grammar */
%options flex case-insensitive
%lex
%%
^\#.*                    return false;
\n                       return false;
\t                       return false;
\s                       return false;
"def"                    return "DEF";
"while"                  return "WHILE";
"if"                     return "IF";
"else if"                return "ELSEIF";
"else"                   return "ELSE";
"and"                    return "&";
"or"                     return "|";
"not"                    return "!";
"true"                   return "TRUE";
"false"                  return "FALSE";
"return"                 return "RETURN";
//"["                      return "[";
//"]"                      return "]";
"("                      return "(";
")"                      return ")";
"{"                      return "{";
"}"                      return "}";
"None"                   return "NONE";
"=="                      return "COMP";
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
[\<\>][\=]?              return "COMP";
\"[^\"]*\"               return "STRING";
[0-9]+("."[0-9]+)?\b     return "NUMBER";
[A-Za-z]([A-Za-z0-9])*   return "NAME";

<<EOF>>                  return 'EOF';

/lex
%start expressions


// %% //grammar %%
%token EOF
%token DEC
%token INC
%token DEF
%token WHILE
%token COMP
%token IF
%token NONE
%token NAME
%token NUMBER
%token STRING
%token TRUE
%token FALSE
%token RETURN
%token ELSE
%token ELSEIF

%right '='
%left '+', '-'
%left '*', '/'
%left '^'

%%

expressions: program EOF;


op: '*' | '+' | '-' | '^' | '/';

program: program function ';'
	| function ';';

function: DEF NAME '(' optargs ')' body;

optargs:
    | optargs "," NAME
    | NAME ;

args: | args ',' expr | expr;

body: '{' exprs '}';

decl: NAME "=" expr;

cond: expr | expr '|' cond | expr '&' cond | '!' cond | expr COMP expr;

ifrest: | ELSE body | ELSEIF  '(' cond ')' body ifrest;

ifst: IF '(' cond ')' body ifrest;

whilest: WHILE '(' cond ')' body;


operand: NONE
	| NAME
	| NUMBER
	| STRING
	| NAME DEC
	| NAME INC
	| NAME '(' args ')'
        | '(' operand op operand ')'
	| '(' op opreand ')'
	| '(' operand ')';

expr :
     RETURN expr
    | op operand
    | operand op operand
    | ifst
    | whilest
    | operand;

exprs: exprs decl ';'
     | exprs expr ';'
     | expr ';'
     | decl ';';

	


%%
