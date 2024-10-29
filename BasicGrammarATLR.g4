grammar BasicGrammarATLR;

programa : linhas+
        ;
linhas : atrib  EOL
           | function
           | decisionFunc
           | loopFunc
           | in EOL //input 
           | out EOL //output
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
//int funcao(expr){}
function : 
    
    ;
// scanf(expr);
in : READ '('VAR')';
//printf("mensagem", expr);
out : PRINT '('VAR')';

// if () {} elif(){} else {} 
decisionFunc : IF '('expression')' bloco
    |          IF '(' expression ')' ELSE bloco 
    |          IF '('expression')' bloco ELIF'('expression')' bloco ELSE bloco


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
RD : 'read';
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
VAR: [a-zA-z]+;
NUMDF : [0-9]+ '.' [0-9]+;
TYPEOF : 'typeof';
NUM : [0-9]+;
STR : '"' ~[\n"]*'"';
COMMENT: '//' ~[\r\n]* -> skip;
BOOL : 'true'|'false';
//importes, defines e returns 
RETURN : 'return';
IMPORT : '#import';
DEFINE : '#define';
