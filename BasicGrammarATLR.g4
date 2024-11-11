grammar BasicGrammarATLR;

programa : linhas+
        ;
linhas : atrib  EOL
           | function
           | in EOL //input 
           | out EOL //output
           | decisionFunc
           | loopFunc
           | calling_function EOL
           | library 
           | casting EOL
           | typeof EOL
           | ternary EOL 
           ; //Maybestructlater 

// int x = 0; x = 30;   
atrib : DOUBLE VAR '=' expression
    |   INT VAR '=' expression
    |   FLOAT VAR '=' expression
    |   STRING VAR '=' STR
    |   BOOLEAN VAR '=' BOOL
    |   VAR '=' STR
    |   VAR '=' BOOL 
    ;

// scanf(expr);
in : READ '('VAR')';
//printf("mensagem", expr);
out : PRINT '('VAR')';

expression : terminais '+' expression
            | terminais '-' expression
            | terminais
            ;
terminais : fator '*' terminais
        |   fator '/' terminais
        |   fator '%' terminais
        | fator
        ;
fator : '(' expression ')'
    |   NUM | VAR | STR ; 

// if () {} elif(){} else {} 
decisionFunc : IF '('expression')' bloco
    |          IF '(' expression ')' ELSE bloco 
    |          IF '('expression')' bloco ELIF'('expression')' bloco ELSE bloco
    ;

loopFunc : WHILE '(' exprbloco ')' bloco 
        ;

bloco : '{' linhas+ '}' ;

returnBloco : '{' returnBloco '}' ;

returnBody : linhas 
        |   linhas returnBody
        |   RETURN BOOL EOL 
        |   RETURN STR EOL 
        |   RETURN expression EOL 
        |   RETURN EOL
        ;

exprbloco : expression RELOP=(EQUAL |NEG | ME | MA | MEI | MAI) expression
        |   expression
        ;

function : TYPE=(INT | DOUBLE | BOOLEAN | STRING) VAR '(' parametros')'
        |  VOID VAR '('parametros')' returnBloco
        ;

parametros : TYPE=(INT | DOUBLE | BOOLEAN | STRING) VAR 
        |   TYPE=(INT | DOUBLE | BOOLEAN | STRING) VAR VIR parametros
        |
        ;

paramCall : fator   
        |   fator VIR paramCall
        |
        ;

calling_function : VAR '(' paramCall')'
        ;

library: IMPORT VAR EOL
        ;

casting: '('TYPE=(INT|BOOLEAN|STRING)')' VAR
        ;

typeof : TYPEOF '(' VAR ')'
        ;

ternary : exprbloco '?' e=bloco ':' e2=bloco
        ;

// Token virgula
EOL : ';';
// token das funçoes de decisão, loop 
WHILE : 'while';
FOR : 'for';
IF : 'if';
ELSE : 'else';
ELIF : 'elif';
//input e output
PRINT : 'print';
READ : 'read';
//tipos
INT : 'int';
DOUBLE : 'double';
BOOLEAN : 'boolean';
STRING : 'string';
VOID : 'void';
FLOAT : 'float';
//operadores de aritmetica
SOMA : '+';
SUB : '-';
DIV : '/';
MULT : '*';
ASSING : '=';
MOD : '%';
//Op de lógica
MAI: '>=';
MEI: '<=';
EQUAL : '==';
NEG : '!=';
MA : '>';
ME : '<'; 
// blocos 
OE : '(';
EO : ')';
VIR : ',';
CD : '}';
CE : '{';
//Variaveis e números 
NUM : [0-9]+;
VAR: [a-zA-z]+;
NUMDF : [0-9]+ '.' [0-9]+;
TYPEOF : 'typeof';
STR : '"' ~[\n"]*'"';
COMMENT: '//' ~[\r\n]* -> skip;
BOOL : 'true'|'false';
//importes, defines e returns 
RETURN : 'return';
IMPORT : '#import';
DEFINE : '#define';
