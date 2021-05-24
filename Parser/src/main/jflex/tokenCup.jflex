import java_cup.runtime.Symbol

%%
%public
%class LexScannerCup
%type java_cup.runtime.Symbol
%line
%full
%char
%cup
%column

%init{
  private Symbol symbol(int type, Object value){
    return new Symbol(type, yyline, yycolumn, value);
  }
  private Symbol symbol(int type){
    return new Symbol(type, yyline, yycolumn);
  }
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
  return new Symbol(sym.AUTO, yychar, yyline, yytext());
}

"break" {
  return new Symbol(sym.BREAK, yychar, yyline, yytext());
}

"case" {
  return new Symbol(sym.CASE, yychar, yyline, yytext());
}

"char" {
  return new Symbol(sym.CHAR, yychar, yyline, yytext());
}

"const" {
  return new Symbol(sym.CONST, yychar, yyline, yytext());
}

"continue" {
  return new Symbol(sym.CONTINUE, yychar, yyline, yytext());
}

"default" {
  return new Symbol(sym.DEFAULT, yychar, yyline, yytext());
}

"do" {
  return new Symbol(sym.DO, yychar, yyline, yytext());
}

"double" {
  return new Symbol(sym.DOUBLE, yychar, yyline, yytext());
}

"else" {
  return new Symbol(sym.ELSE, yychar, yyline, yytext());
}

"enum" {
  return new Symbol(sym.ENUM, yychar, yyline, yytext());
}

"extern" {
  return new Symbol(sym.EXTERN, yychar, yyline, yytext());
}

"float" {
  return new Symbol(sym.FLOAT, yychar, yyline, yytext());
}

"for" {
  return new Symbol(sym.FOR, yychar, yyline, yytext());
}

"goto" {
  return new Symbol(sym.GOTO, yychar, yyline, yytext());
}

"if" {
  return new Symbol(sym.IF, yychar, yyline, yytext());
}

"int" {
  return new Symbol(sym.INT, yychar, yyline, yytext());
}

"long" {
  return new Symbol(sym.LONG, yychar, yyline, yytext());
}

"register" {
  return new Symbol(sym.REGISTER, yychar, yyline, yytext());
}

"return" {
  return new Symbol(sym.RETURN, yychar, yyline, yytext());
}

"short" {
  return new Symbol(sym.SHORT, yychar, yyline, yytext());
}

"signed" {
  return new Symbol(sym.SIGNED, yychar, yyline, yytext());
}

"sizeof" {
  return new Symbol(sym.SIZEOF, yychar, yyline, yytext());
}

"static" {
  return new Symbol(sym.STATIC, yychar, yyline, yytext());
}

"struct" {
  return new Symbol(sym.STRUCT, yychar, yyline, yytext());
}

"switch" {
  return new Symbol(sym.SWITCH, yychar, yyline, yytext());
}

"typedef" {
  return new Symbol(sym.TYPEDEF, yychar, yyline, yytext());
}

"union" {
  return new Symbol(sym.UNION, yychar, yyline, yytext());
}

"unsigned" {
  return new Symbol(sym.UNSIGNED, yychar, yyline, yytext());
}

"void" {
  return new Symbol(sym.VOID, yychar, yyline, yytext());
}

"volatile" {
  return new Symbol(sym.VOLATILE, yychar, yyline, yytext());
}

"while" {
  return new Symbol(sym.WHILE, yychar, yyline, yytext());
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
  return new Symbol(sym.DEC_LIT, yychar, yyline, yytext());
}

{OCTAL_LITERAL} {
  return new Symbol(sym.OCTAL_LIT, yychar, yyline, yytext());
}

{HEX_LITERAL} {
  return new Symbol(sym.HEX_LIT, yychar, yyline, yytext());
}

{DOUBLE_LITERAL} {
  return new Symbol(sym.DOUBLE_LIT, yychar, yyline, yytext());
}

{STRING_LITERAL} {
  return new Symbol(sym.STRING_LIT, yychar, yyline, yytext());
}

{CHAR_LITERAL} {
  return new Symbol(sym.CHAR_LIT, yychar, yyline, yytext());
}

//*********************************IDENTIFICADOR*********************************
{IDENTIFIER} {
  return new Symbol(sym._IDENTIFIER, yychar, yyline, yytext());
}

//*********************************OPERADORES*********************************
\, {
  return new Symbol(sym.COMMA, yychar, yyline, yytext());
}

\; {
  return new Symbol(sym.SEMICOLON, yychar, yyline, yytext());
}

\+\+ {
  return new Symbol(sym.INCREMENT, yychar, yyline, yytext());
}

\-\- {
  return new Symbol(sym.DECREMENT, yychar, yyline, yytext());
}

\=\= {
  return new Symbol(sym.EQUAL_TO, yychar, yyline, yytext());
}

\>\= {
  return new Symbol(sym.GRATER_EQUAL, yychar, yyline, yytext());
}

\> {
  return new Symbol(sym.GRATER, yychar, yyline, yytext());
}

\? {
  return new Symbol(sym.TERNARY, yychar, yyline, yytext());
}

\<\= {
  return new Symbol(sym.LESS_EQUAL, yychar, yyline, yytext());
}

\< {
  return new Symbol(sym.LESS, yychar, yyline, yytext());
}

\!\= {
  return new Symbol(sym.NOT_EQUAL, yychar, yyline, yytext());
}

\|\| {
  return new Symbol(sym.OR, yychar, yyline, yytext());
}

\&\& {
  return new Symbol(sym.AND, yychar, yyline, yytext());
}

\! {
  return new Symbol(sym.NOT, yychar, yyline, yytext());
}

\= {
  return new Symbol(sym.EQUAL, yychar, yyline, yytext());
}

\+ {
  return new Symbol(sym.PLUS, yychar, yyline, yytext());
}

\- {
  return new Symbol(sym.MINUS, yychar, yyline, yytext());
}

\* {
  return new Symbol(sym.MULT, yychar, yyline, yytext());
}

\/ {
  return new Symbol(sym.DIV, yychar, yyline, yytext());
}

\% {
  return new Symbol(sym.MODULE, yychar, yyline, yytext());
}

\( {
  return new Symbol(sym.RBO, yychar, yyline, yytext());
}

\) {
  return new Symbol(sym.RBC, yychar, yyline, yytext());
}

\[ {
  return new Symbol(sym.SBO, yychar, yyline, yytext());
}

\] {
  return new Symbol(sym.SBC, yychar, yyline, yytext());
}

\{ {
  return new Symbol(sym.CBO, yychar, yyline, yytext());
}

\} {
  return new Symbol(sym.CBC, yychar, yyline, yytext());
}

\: {
  return new Symbol(sym.COLON, yychar, yyline, yytext());
}

\. {
  return new Symbol(sym.DOT, yychar, yyline, yytext());
}

\+\= {
  return new Symbol(sym.PLUS_ASSIGNMENT, yychar, yyline, yytext());
}

\-\= {
  return new Symbol(sym.MINUS_ASSIGNMENT, yychar, yyline, yytext());
}

\*\= {
  return new Symbol(sym.MULT_ASSIGNMENT, yychar, yyline, yytext());
}

\/\= {
  return new Symbol(sym.DIV_ASSIGNMENT, yychar, yyline, yytext());
}

\& {
  return new Symbol(sym.BIT_AND, yychar, yyline, yytext());
}

\^ {
  return new Symbol(sym.XOR, yychar, yyline, yytext());
}

\| {
  return new Symbol(sym.BIT_OR, yychar, yyline, yytext());
}

\>\> {
  return new Symbol(sym.RIGHT_SHIFT, yychar, yyline, yytext());
}

\<\< {
  return new Symbol(sym.LEFT_SHIFT, yychar, yyline, yytext());
}

\~ {
  return new Symbol(sym.COMPLEMENT, yychar, yyline, yytext());
}

\%\= {
  return new Symbol(sym.MOD_ASSIGNMENT, yychar, yyline, yytext());
}

\&\= {
  return new Symbol(sym.AND_ASSIGNMENT, yychar, yyline, yytext());
}

\^\= {
  return new Symbol(sym.XOR_ASSIGNMENT, yychar, yyline, yytext());
}

\|\= {
  return new Symbol(sym.OR_ASSIGNMENT, yychar, yyline, yytext());
}

\<\<\= {
  return new Symbol(sym.LEFT_SHIFT_ASSIGNMENT, yychar, yyline, yytext());
}

\>\>\= {
  return new Symbol(sym.RIGHT_SHIFT_ASSIGNMENT, yychar, yyline, yytext());
}

\-\> {
  return new Symbol(sym.OP, yychar, yyline, yytext());
}

//Error
. {
  return new Symbol(sym.ERROR, yychar, yyline, yytext());
}

<<EOF>> {
  return null;
}

