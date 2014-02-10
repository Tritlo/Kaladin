/* lexical grammar */
%lex
%%
^\#.*                    return '#';
\n                       return "NL";
\t                       return "TAB";
\s                       return "WS";
"when"                   return "WH";
"set"                    return "S";
"wait"                   return "WT";
"and"                    return "&&";
"or"                     return "||";
"not"                    return "!";
"is"                     return "==";
"true"                   return "T";
"false"                  return "F";
"for"                    return "f";
"in"                     return "i";
"while"                  return "while";
"stop"                   return "s";
"if"                     return "I";
"["                      return "[";
"]"                      return "]";
"("                      return "(";
")"                      return ")";
"{"                      return "{";
"}"                      return "}";
"return"                 return "R";
"None"                   return "NONE";
\"[^\"]*\"               return "str";
[0-9]+("."[0-9]+)?\b     return 'num';
[A-Za-z]([A-Za-z0-9])*   return 'id';
":="                     return "mon";
"="                      return "var";
[\*\+\|\&\^\/\-]         return "op";
\:                       return ":";
\;                       return ";";
[\<\>][\=]?              return "comp";                 
<<EOF>>                  return 'EOF';

/lex
%start expressions
%%
