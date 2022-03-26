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
%cup

// code a ajouter dans la classe produite
%{eofval
    return new Symbol(SimpleParserSym.EOF);
%eofval}

/* definitions regulieres */
nombre = [0-9]+
espaces = \n|\r|\r\n
separateur = ";"
plus = "+"
moins = "-"
pad = "("
div = "/"
mult = "*"
pag = ")"

%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */
{espaces} {/*Rien à faire*/}
{nombre} {return new Symbol(SimpleParserSym.NUMBER, new Integer(yytext())); }
{plus} {return new Symbol(SimpleParserSym.PLUS);}
{moins} {return new Symbol(SimpleParserSym.MOINS);}
{mult} {return new Symbol(SimpleParserSym.MULT);}
{div} {return new Symbol(SimpleParserSym.DIV);}
{pad} {return new Symbol(SimpleParserSym.PAD);}
{pag} {return new Symbol(SimpleParserSym.PAG);}


