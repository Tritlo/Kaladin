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
"**"                      return '^';
"*"                      return '*';
"/"                      return '/';
"-"                      return '-';
"+"                      return '+';
\:                       return ":";
\;                       return ";";
[\<\>][\=]?              return "c";                 
<<EOF>>                  return 'F';

/lex
%left '+' '-'
%left '*' '/'

%start expressions

%% //grammar %%
expressions
    : e EOF
        {}
    ;


%%
