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
"["                      return "[";
"]"                      return "]";
"("                      return "(";
")"                      return ")";
"{"                      return "{";
"}"                      return "}";
"None"                   return "NONE";
"in"                     return "COMP";
"is"                     return "COMP";
"=="                     return "COMP";
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

args: 
    | args ',' expr 
    | expr;

body: '{' exprs '}';

decl: NAME "=" expr;

conds: cond
     | cond OR conds
     | cond AND conds;

cond: expr
    | expr COMP expr
    | NOT cond;

ifrest: 
      | ELSE body 
      | ELSEIF  '(' conds ')' body ifrest;

ifst: IF '(' conds ')' body ifrest;

whilest: WHILE '(' conds ')' body;

operands: | operands ',' operand | operand;

list: '[' operands ']';
tuple: '(' operands ')';
         

operand:  NONE
	| NAME
	| NUMBER
	| STRING
	| NAME DEC
	| NAME INC
        | list
	| tuple
	| NAME '(' args ')'
        | '(' operand op operand ')'
	| '(' op operand ')';

expr: RETURN expr
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
