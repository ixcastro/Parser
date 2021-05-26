%%
%public
%class LexScanner
%type Tokens
%line
%column
%init{
  public String lexeme;
 /* Código que se ejecutará en el constructor de la clase */
%init}
  //********************EXPRESIONES REGULARES********************

  //********************LITERALES********************
  DEC_LITERAL = ([0]|[-]?[1-9][0-9]*)
  OCTAL_LITERAL = [-]?0[0-7]+
  HEX_LITERAL = [-]?0[xX][0-9a-fA-F]+
  DOUBLE_LITERAL = [-]?[0-9]+.[0-9]+

  CHAR_LITERAL =  '(([^'\n\\])|(\\x[0-9]+)|(\\[a-z]))'
  STRING_LITERAL = \"([^\"\\]|\\[a-zA-Z\"\\])*\"

  //********************NEW LINE********************
  NEW_LINE = \n|\r\n

  //********************BLANK_SPACE********************
  BLANK_SPACE = " "

  //********************COMMENTS********************
  BLOCK_COMMENT = \/\*(.|\n|\r\n)*\*\/ //CORREGIR
  LINE_COMMENT = [//].*

  //********************IDENTIFIER********************
  IDENTIFIER = [A-Za-z]([A-Za-z0-9])*

%%

//****************************************REGLAS***************************************
//*********************************PALABRAS RESERVADAS*********************************
"auto" {
  lexeme = yytext();
  return AUTO;
}

"break" {
  lexeme = yytext();
  return BREAK;
}

"case" {
  lexeme = yytext();
  return CASE;
}

"char" {
  lexeme = yytext();
  return CHAR;
}

"const" {
  lexeme = yytext();
  return CONST;
}

"continue" {
  lexeme = yytext();
  return CONTINUE;
}

"default" {
  lexeme = yytext();
  return DEFAULT;
}

"do" {
  lexeme = yytext();
  return DO;
}

"double" {
  lexeme = yytext();
  return DOUBLE;
}

"else" {
  lexeme = yytext();
  return CHAR;
}

"enum" {
  lexeme = yytext();
  return ENUM;
}

"extern" {
  lexeme = yytext();
  return EXTERN;
}

"float" {
  lexeme = yytext();
  return FLOAT;
}

"for" {
  lexeme = yytext();
  return FOR;
}

"goto" {
  lexeme = yytext();
  return GOTO;
}

"if" {
  lexeme = yytext();
  return IF;
}

"int" {
  lexeme = yytext();
  return INT;
}

"long" {
  lexeme = yytext();
  return LONG;
}

"register" {
  lexeme = yytext();
  return REGISTER;
}

"return" {
  lexeme = yytext();
  return RETURN;
}

"short" {
  lexeme = yytext();
  return SHORT;
}

"signed" {
  lexeme = yytext();
  return SIGNED;
}

"sizeof" {
  lexeme = yytext();
  return SIZEOF;
}

"static" {
  lexeme = yytext();
  return STATIC;
}

"struct" {
  lexeme = yytext();
  return STRUCT;
}

"switch" {
  lexeme = yytext();
  return SWITCH;
}

"typedef" {
  lexeme = yytext();
  return TYPEDEF;
}

"union" {
  lexeme = yytext();
  return UNION;
}

"unsigned" {
  lexeme = yytext();
  return UNSIGNED;
}

"void" {
  lexeme = yytext();
  return VOID;
}

"volatile" {
  lexeme = yytext();
  return VOLATILE;
}

"while" {
  lexeme = yytext();
  return WHILE;
}

//*********************************COMMENTS*********************************
{BLOCK_COMMENT} { } //IGNORE BLOCK COMMENTS

{LINE_COMMENT} { } //IGNORE LINE COMMENTS

//**********************************NEW LINE********************************** 
{NEW_LINE} { } //IGNORE NEW LINES

//********************************BLANK SPACE********************************* 
{BLANK_SPACE} { } //IGNORE A BLANK SPACE

//*********************************LITERALES********************************* 
{DEC_LITERAL} {
  lexeme = yytext();
  return DEC_LIT;
}

{OCTAL_LITERAL} {
  lexeme = yytext();
  return OCTAL_LIT;
}

{HEX_LITERAL} {
  lexeme = yytext();
  return HEX_LIT;
}

{DOUBLE_LITERAL} {
  lexeme = yytext();
  return DOUBLE_LIT;
} 

{STRING_LITERAL} {
  lexeme = yytext();
  return STRING_LIT;
}

{CHAR_LITERAL} {
  lexeme = yytext();
  return CHAR_LIT;
}

//*********************************IDENTIFICADOR*********************************
{IDENTIFIER} {
  lexeme = yytext();
  return _IDENTIFIER;
}

//*********************************OPERADORES********************************* 
\, {
  lexeme = yytext();
  return COMMA;
}

\; {
  lexeme = yytext();
  return SEMICOLON;
}

\+\+ {
  lexeme = yytext();
  return INCREMENT;
}

\-\- {
  lexeme = yytext();
  return DECREMENT;
}

\=\= {
  lexeme = yytext();
  return EQUAL_TO;
}

\>\= {
  lexeme = yytext();
  return GRATER_EQUAL;
}

\> {
  lexeme = yytext();
  return GRATER;
}

\? {
  lexeme = yytext();
  return TERNARY;
}

\<\= {
  lexeme = yytext();
  return LESS_EQUAL;
}

\< {
  lexeme = yytext();
  return LESS;
}

\!\= {
  lexeme = yytext();
  return NOT_EQUAL;
}

\|\| {
  lexeme = yytext();
  return OR;
}

\&\& {
  lexeme = yytext();
  return AND;
}

\! {
  lexeme = yytext();
  return NOT;
}

\= {
  lexeme = yytext();
  return EQUAL;
}

\+ {
  lexeme = yytext();
  return PLUS;
}

\- {
  lexeme = yytext();
  return MINUS;
}

\* {
  lexeme = yytext();
  return TIMES;
}

\/ {
  lexeme = yytext();
  return DIV;
}

\% {
  lexeme = yytext();
  return MODULE;
}

\( {
  lexeme = yytext();
  //ROUND BRACKET OPEN
  return RBO;
}

\) {
  lexeme = yytext();
  //ROUND BRACKET CLOSE
  return RBC;
}

\[ {
  lexeme = yytext();
  //SCUARE BRACKET OPEN
  return SBO;
}

\] {
  lexeme = yytext();
  //SCUARE BRACKET CLOSE
  return SBC;
}

\{ {
  lexeme = yytext();
  //CURLY BRACKET OPEN
  return CBO;
}

\} {
  lexeme = yytext();
  //CURLY BRACKET CLOSE
  return CBC;
}

\: {
  lexeme = yytext();
  return COLON;
}

\. {
  lexeme = yytext();
  return DOT;
}

\+\= {
  lexeme = yytext();
  return PLUS_ASSIGNMENT;
}

\-\= {
  lexeme = yytext();
  return MINUS_ASSIGNMENT;
}

\*\= {
  lexeme = yytext();
  return TIMES_ASSIGNMENT;
}

\/\= {
  lexeme = yytext();
  return DIV_ASSIGNMENT;
}

\& {
  lexeme = yytext();
  return BIT_AND;
}

\^ {
  lexeme = yytext();
  return XOR;
}

\| {
  lexeme = yytext();
  return BIT_OR;
}

\>\> {
  lexeme = yytext();
  return RIGHT_SHIFT;
}

\<\< {
  lexeme = yytext();
  return LEFT_SHIFT;
}

\~ {
  lexeme = yytext();
  return COMPLEMENT;
}

\%\= {
  lexeme = yytext();
  return MOD_ASSIGNMENT;
}

\&\= {
  lexeme = yytext();
  return AND_ASSIGNMENT;
}

\^\= {
  lexeme = yytext();
  return XOR_ASSIGNMENT;
}

\|\= {
  lexeme = yytext();
  return OR_ASSIGNMENT;
}

\<\<\= {
  lexeme = yytext();
  return LEFT_SHIFT_ASSIGNMENT;
}

\>\>\= {
  lexeme = yytext();
  return RIGHT_SHIFT_ASSIGNMENT;
}

\-\> {
  lexeme = yytext();
  return OP;
}

//Error
. {
  lexeme = yytext();
  return ERROR;
}

<<EOF>> {
  return null;
}

