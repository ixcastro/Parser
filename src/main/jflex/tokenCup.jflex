package scanner;
import java_cup.runtime.Symbol;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
import jcup.sym;

%%
%public
%class JFlexScanner
%cup
%implements sym
%char
%line
%column

%{
  StringBuffer string = new StringBuffer();
  ComplexSymbolFactory symbolFactory;
  
  public JFlexScanner(java.io.Reader in, ComplexSymbolFactory sf){
	    this(in);
    	symbolFactory = sf;
  }

  private Symbol symbol(String name, int sym) {
      int line = yyline;
      int column = yycolumn;
      int char_int = (int)yychar;
      Location left = new Location(line + 1, column + 1, char_int);
      Location right = new Location(line + 1, column + yylength(), char_int + yylength());
      return symbolFactory.newSymbol(name, sym, left, right);
  }

  private Symbol symbol(String name, int sym, Object val) {
      int line = yyline;
      int column = yycolumn;
      int char_int = (int)yychar;
      Location left = new Location(line + 1, column + 1, char_int);
      Location right= new Location(line + 1, column + yylength(), char_int + yylength());
      return symbolFactory.newSymbol(name, sym, left, right, val);
  }

  private void error(String message) {
    System.out.println("Error at line "+(yyline+1)+", column "+(yycolumn+1)+" : "+message);
  }
%}
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
  BLOCK_COMMENT = \/\*[\s\S]*?\*\/
  //BLOCK_COMMENT = \/\*(^|\n|\r\n)*\*\/ 
  LINE_COMMENT = [//].*

  //********************IDENTIFIER********************
  _IDENTIFIER = [A-Za-z]([A-Za-z0-9])*

%%

//****************************************REGLAS***************************************
//*********************************PALABRAS RESERVADAS*********************************
"auto" {
  return symbol("auto", AUTO);
}

"break" {
  return symbol("break", BREAK);
}

"case" {
  return symbol("case", CASE);
}

"char" {
  return symbol("char", CHAR);
}

"const" {
  return symbol("const", CONST);
}

"continue" {
  return symbol("continue", CONTINUE);
}

"default" {
  return symbol("default", DEFAULT);
}

"do" {
  return symbol("do", DO);
}

"double" {
  return symbol("double", DOUBLE);
}

"else" {
  return symbol("else", ELSE);
}

"enum" {
  return symbol("enum", ENUM);
}

"extern" {
  return symbol("extern", EXTERN);
}

"float" {
  return symbol("float", FLOAT);
}

"for" {
  return symbol("for", FOR);
}

"goto" {
  return symbol("goto", GOTO);
}

"if" {
  return symbol("if", IF);
}

"int" {
  return symbol("int", INT);
}

"long" {
  return symbol("long", LONG);
}

"register" {
  return symbol("register", REGISTER);
}

"return" {
  return symbol("return", RETURN);
}

"short" {
  return symbol("short", SHORT);
}

"signed" {
  return symbol("signed", SIGNED);
}

"sizeof" {
  return symbol("sizeof", SIZEOF);
}

"static" {
  return symbol("static", STATIC);
}

"struct" {
  return symbol("struct", STRUCT);
}

"switch" {
  return symbol("switch", SWITCH);
}

"typedef" {
  return symbol("typedef", TYPEDEF);
}

"union" {
  return symbol("union", UNION);
}

"unsigned" {
  return symbol("unsigned", UNSIGNED);
}

"void" {
  return symbol("void", VOID);
}

"volatile" {
  return symbol("volatile", VOLATILE);
}

"while" {
  return symbol("while", WHILE);
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
  return symbol("DEC_LIT", DEC_LIT, Integer.parseInt(yytext()));
}

{OCTAL_LITERAL} {
  return symbol("OCTAL_LIT", OCTAL_LIT, Integer.parseInt(yytext(), 8));
}

{HEX_LITERAL} {
  return symbol("HEX_LIT", HEX_LIT, Integer.parseInt(yytext(), 16));
}

{DOUBLE_LITERAL} {
  return symbol("DOUBLE_LIT", DOUBLE_LIT, Double.parseDouble(yytext()));
}

{STRING_LITERAL} {
  return symbol("STRING_LIT", STRING_LIT, yytext());
}

{CHAR_LITERAL} {
  return symbol("CHAR_LIT", CHAR_LIT, yytext());
}

//*********************************IDENTIFICADOR*********************************
{_IDENTIFIER} {
  return symbol("IDENTIFIER", IDENTIFIER, yytext());
}

//*********************************OPERADORES*********************************
\, {
  return symbol("COMMA", COMMA);
}

\; {
  return symbol("SEMICOLON", SEMICOLON);
}

\+\+ {
  return symbol("INCREMENT", INCREMENT);
}

\-\- {
  return symbol("DECREMENT", DECREMENT);
}

\=\= {
  return symbol("EQUAL_EQUAL", EQUAL_EQUAL);
}

\>\= {
  return symbol("GREATER_EQUAL", GREATER_EQUAL);
}

\> {
  return symbol("GREATER", GREATER);
}

\? {
  return symbol("TERNARY", TERNARY);
}

\<\= {
  return symbol("LESS_EQUAL", LESS_EQUAL);
}

\< {
  return symbol("LESS", LESS);
}

\!\= {
  return symbol("NOT_EQUAL", NOT_EQUAL);
}

\|\| {
  return symbol("OR", OR);
}

\&\& {
  return symbol("AND", AND);
}

\! {
  return symbol("NOT", NOT);
}

\= {
  return symbol("EQUAL", EQUAL);
}

\+ {
  return symbol("PLUS", PLUS);
}

\- {
  return symbol("MINUS", MINUS);
}

\* {
  return symbol("TIMES", TIMES);
}

\/ {
  return symbol("DIV", DIV);
}

\% {
  return symbol("MODULE", MODULE);
}

\( {
  return symbol("RBO", RBO);
}

\) {
  return symbol("RBC", RBC);
}

\[ {
  return symbol("SBO", SBO);
}

\] {
  return symbol("SBC", SBC);
}

\{ {
  return symbol("CBO", CBO);
}

\} {
  return symbol("CBC", CBC);
}

\: {
  return symbol("COLON", COLON);
}

\. {
  return symbol("DOT", DOT);
}

\+\= {
  return symbol("PLUS_ASSIGNMENT", PLUS_ASSIGNMENT);
}

\-\= {
  return symbol("MINUS_ASSIGNMENT", MINUS_ASSIGNMENT);
}

\*\= {
  return symbol("TIMES_ASSIGNMENT", TIMES_ASSIGNMENT);
}

\/\= {
  return symbol("DIV_ASSIGNMENT", DIV_ASSIGNMENT);
}

\& {
  return symbol("BIT_AND", BIT_AND);
}

\^ {
  return symbol("XOR", XOR);
}

\| {
  return symbol("BIT_OR", BIT_OR);
}

\>\> {
  return symbol("RIGHT_SHIFT", RIGHT_SHIFT);
}

\<\< {
  return symbol("LEFT_SHIFT", LEFT_SHIFT);
}

\~ {
  return symbol("COMPLEMENT", COMPLEMENT);
}

\%\= {
  return symbol("MOD_ASSIGNMENT", MOD_ASSIGNMENT);
}

\&\= {
  return symbol("AND_ASSIGNMENT", AND_ASSIGNMENT);
}

\^\= {
  return symbol("XOR_ASSIGNMENT", XOR_ASSIGNMENT);
}

\|\= {
  return symbol("OR_ASSIGNMENT", OR_ASSIGNMENT);
}

\<\<\= {
  return symbol("LEFT_SHIFT_ASSIGNMENT", LEFT_SHIFT_ASSIGNMENT);
}

\>\>\= {
  return symbol("RIGHT_SHIFT_ASSIGNMENT", RIGHT_SHIFT_ASSIGNMENT);
}

\-\> {
  return symbol("OP", OP);
}

//Error
. {
  return symbol("ERROR", ERROR);
}

<<EOF>> {
  return symbol("auto", AUTO);
}