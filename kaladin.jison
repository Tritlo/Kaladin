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

%left INC DEC
%right '='
%left '+', '-'
%left '*', '/'
%left '^'
%left UMINUS
%left '<=' '>=' '<' '>' '==' IS IN
%left NOT
%left OR
%left AND
%right RETURN

%start expressions

%%

expressions: program EOF;


//op: '*' | '+' | '-' | '^' | '/';

program: program function ';'
       | function ';';

function: DEF NAME '(' optnames ')' body;

names: names ',' NAME
     | NAME;

optnames: | names;


args: args ',' expr 
    | expr;

optargs: | args;

body: '{' optdecls optexprs '}';

decl: VAR NAME "=" expr;

optdecls: | decls;

decls: decls decl ';'
     | decl ';';


ifrest: 
      | ELSE body 
      | ELSEIF  '(' expr ')' body ifrest;

ifst: IF '(' expr ')' body ifrest;

whilest: WHILE '(' expr ')' body whilerest;
whilerest: | ELSE body;


operands: operands ',' operand | operand;

commasepexprs: commasepexprs ',' expr
             | expr;

optcommasepexprs: | commasepexprs;


list: '[' optcommasepexprs ']';
         
expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | expr '^' expr
    | '-' expr %prec UMINUS
    | expr '<=' expr
    | expr '>=' expr
    | expr '<' expr
    | expr '>' expr
    | expr '==' expr
    | expr IS expr
    | expr IN expr
    | expr AND expr
    | expr OR expr
    | NOT expr
    | expr INC
    | expr DEC
    | NAME 
    | RETURN expr
    | NAME '(' optargs ')'
    | list
    | function
    | NONE
    | STRING
    | NUMBER 
    | '(' expr ')'
    | ifst
    | whilest;


exprs: exprs expr ';'
     | expr ';';

optexprs: | exprs;

%%
