/* lexical grammar */
%options flex case-insensitive
%lex
%%

\n                                  return "NL";
\t                                  return "T";
\s                                  return "";
\(.+\)                              return "//";
\"[^\"]*\"                          return "str";
"This refers to"                    return "import";
"both"                              return "b"; //Used for having only two values, where OA would be weird.
"The following is called"           return "def";
"the"                               return "t";
", which takes in"                  return "args";
", and"                             return "OA"; //Oxford and
"value"                             return "v";
"let"                               return "l";
"be"                                return "b";
"if not,"                           return "else";
"if"                                return "i";
"then"                              return "th";
"while"                             return "w";
"to"                                return "to";
"by"                                return "by";
"from"                              return "frm";
"is greater than or equal to"       return ">=";
"is greater than"                   return ">";
"is less than or equal to"          return "<=";
"is less than"                      return "<";
"not"                               return "!";
"and"                               return "&&";
"or"                                return "||";
"is"                                return "==";
"finally"                           return "F";
"Now"                               return "N";
"return"                            return "ret";
[\<\>][\=]?                         return "comp";
[0-9]+("."[0-9]+)?\b                return 'num';
"."                                 return "dot";
","                                 return ",";
[A-z](([A-z0-9])+)?                 return "id";
<<EOF>>                             return 'EOF';

/lex
%start expressions
%%
