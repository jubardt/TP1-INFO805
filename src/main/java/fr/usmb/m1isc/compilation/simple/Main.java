package fr.usmb.m1isc.compilation.simple;

import java_cup.runtime.Symbol;

import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws Exception {
        /*SimpleLexer lexer;
        if (args.length > 0)
            lexer = new SimpleLexer(new FileReader(args[0]));
        else
            lexer = new SimpleLexer(new InputStreamReader(System.in));
        @SuppressWarnings("deprecation")
        SimpleParser p = new SimpleParser(lexer);
        p.parse();*/
        CalcFlex yy;
        yy = new CalcFlex((new InputStreamReader(System.in)));
        SimpleParser p = new SimpleParser(yy);
        Symbol result = p.parse();
        System.out.println("Evaluation = "+result.value);
    }
}
