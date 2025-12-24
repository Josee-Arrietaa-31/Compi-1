/* Analizador Léxico para Lenguaje de Configuración de Chips */
/* Proyecto de Compiladores - Scanner con JFlex */

import java_cup.runtime.*;

%%

%class Scanner
%cup
%unicode
%line
%column

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline + 1, yycolumn + 1);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline + 1, yycolumn + 1, value);
    }
    
    private void error(String message) {
        System.err.println("Error léxico en línea " + (yyline + 1) + 
                         ", columna " + (yycolumn + 1) + ": " + message);
    }
%}

/* Definiciones Regulares */
LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]
Comment = "|" [^\r\n]* {LineTerminator}?
MultiLineComment = "є" ~"э"

Digit = [0-9]
Letter = [a-zA-Z]
Identifier = {Letter}({Letter}|{Digit}|_)*

DecimalLiteral = {Digit}+
FloatLiteral = {Digit}+ "." {Digit}+ ([eE][+-]?{Digit}+)?

StringLiteral = \"([^\\\"]|\\.)*\"
CharLiteral = '([^\\']|\\.)'

%%

/* Palabras Reservadas */
<YYINITIAL> {
    /* Tipos de datos */
    "int"           { return symbol(sym.INT, yytext()); }
    "float"         { return symbol(sym.FLOAT, yytext()); }
    "bool"          { return symbol(sym.BOOL, yytext()); }
    "char"          { return symbol(sym.CHAR, yytext()); }
    "string"        { return symbol(sym.STRING, yytext()); }
    "coal"          { return symbol(sym.COAL, yytext()); }
    
    /* Variables y funciones */
    "world"         { return symbol(sym.WORLD, yytext()); }
    "local"         { return symbol(sym.LOCAL, yytext()); }
    "gift"          { return symbol(sym.GIFT, yytext()); }
    
    /* Estructuras de control */
    "decide"        { return symbol(sym.DECIDE, yytext()); }
    "of"            { return symbol(sym.OF, yytext()); }
    "end"           { return symbol(sym.END, yytext()); }
    "else"          { return symbol(sym.ELSE, yytext()); }
    "loop"          { return symbol(sym.LOOP, yytext()); }
    "exit"          { return symbol(sym.EXIT, yytext()); }
    "when"          { return symbol(sym.WHEN, yytext()); }
    "for"           { return symbol(sym.FOR, yytext()); }
    "break"         { return symbol(sym.BREAK, yytext()); }
    "return"        { return symbol(sym.RETURN, yytext()); }
    
    /* Método principal */
    "navidad"       { return symbol(sym.NAVIDAD, yytext()); }
    
    /* Entrada/Salida */
    "show"          { return symbol(sym.SHOW, yytext()); }
    "get"           { return symbol(sym.GET, yytext()); }
    
    /* Valores booleanos */
    "true"          { return symbol(sym.TRUE, yytext()); }
    "false"         { return symbol(sym.FALSE, yytext()); }
    
    /* Operadores relacionales */
    "=="            { return symbol(sym.EQ, yytext()); }
    "!="            { return symbol(sym.NEQ, yytext()); }
    "<="            { return symbol(sym.LEQ, yytext()); }
    ">="            { return symbol(sym.GEQ, yytext()); }
    "<"             { return symbol(sym.LT, yytext()); }
    ">"             { return symbol(sym.GT, yytext()); }

    /* Asignación */
    "="             { return symbol(sym.ASSIGN, yytext()); }
    
    /* Operadores lógicos */
    "@"             { return symbol(sym.AND, yytext()); }
    "~"             { return symbol(sym.OR, yytext()); }
    "Σ"             { return symbol(sym.NOT, yytext()); }
    
    /* Operadores aritméticos */
    "++"            { return symbol(sym.INCREMENT, yytext()); }
    "--"            { return symbol(sym.DECREMENT, yytext()); }
    "+"             { return symbol(sym.PLUS, yytext()); }
    "-"             { return symbol(sym.MINUS, yytext()); }
    "*"             { return symbol(sym.TIMES, yytext()); }
    "//"            { return symbol(sym.DIV_INT, yytext()); }
    "/"             { return symbol(sym.DIV, yytext()); }
    "%"             { return symbol(sym.MOD, yytext()); }
    "^"             { return symbol(sym.POW, yytext()); }

    /* Delimitadores */
    "¿"             { return symbol(sym.LPAREN, yytext()); }
    "?"             { return symbol(sym.RPAREN, yytext()); }
    "¡"             { return symbol(sym.LBRACE, yytext()); }
    "!"             { return symbol(sym.RBRACE, yytext()); }
    "["             { return symbol(sym.LBRACKET, yytext()); }
    /* Delimitadores */
    "¿"             { return symbol(sym.LPAREN, yytext()); }
    "?"             { return symbol(sym.RPAREN, yytext()); }
    "¡"             { return symbol(sym.LBRACE, yytext()); }
    "!"             { return symbol(sym.RBRACE, yytext()); }
    "["             { return symbol(sym.LBRACKET, yytext()); }
    "]"             { return symbol(sym.RBRACKET, yytext()); }
    "endl"          { return symbol(sym.ENDL, yytext()); }
    ","             { return symbol(sym.COMMA, yytext()); }
    "->"            { return symbol(sym.ARROW, yytext()); }
    
    /* Literales */
    {DecimalLiteral}    { return symbol(sym.INT_LITERAL, yytext()); }
    {FloatLiteral}      { return symbol(sym.FLOAT_LITERAL, yytext()); }
    {StringLiteral}     { return symbol(sym.STRING_LITERAL, yytext()); }
    {CharLiteral}       { return symbol(sym.CHAR_LITERAL, yytext()); }
    
    /* Identificadores */
    {Identifier}        { return symbol(sym.ID, yytext()); }
    
    /* Espacios en blanco y comentarios */
    {WhiteSpace}        { /* ignorar */ }
    {Comment}           { /* ignorar */ }
    {MultiLineComment}  { /* ignorar */ }
}

/* Manejo de errores - Modo Pánico */
[^] {
    error("Carácter no reconocido: '" + yytext() + "'");
    /* Continuar con el siguiente carácter (Recuperación en Modo Pánico) */
}

/* EOF */
<<EOF>> { return symbol(sym.EOF); }
