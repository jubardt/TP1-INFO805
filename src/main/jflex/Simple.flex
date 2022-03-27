/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;import java.util.LinkedList;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class CalcFlex
%unicode

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%line
%column
%cup

// code a ajouter dans la classe produite
%{eofval
    return new Symbol(SimpleParserSym.EOF);
%eofval}

/* definitions regulieres */
nombre = [0-9]+
espaces = \n|\r|\r\n|\s|\t
separateur = ";"
plus = "+"
moins = "-"
pad = "("
div = "/"
mult = "*"
pag = ")"
pointvirgule =";"

%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */
{espaces} {/*Rien à faire*/}
{nombre} {return new Symbol(SimpleParserSym.NUMBER, yyline,yycolumn,new Integer(yytext())); }
{plus} {return new Symbol(SimpleParserSym.PLUS, yyline,yycolumn);}
{moins} {return new Symbol(SimpleParserSym.MOINS, yyline,yycolumn);}
{mult} {return new Symbol(SimpleParserSym.MULT, yyline,yycolumn);}
{div} {return new Symbol(SimpleParserSym.DIV, yyline,yycolumn);}
{pad} {return new Symbol(SimpleParserSym.PAD, yyline,yycolumn);}
{pag} {return new Symbol(SimpleParserSym.PAG, yyline,yycolumn);}
{pointvirgule} {return new Symbol(SimpleParserSym.PV, yyline, yycolumn);}
. {/*Rien à faire*/}


