# Gramatica Inicial

##### ( Essa gramatica se encontra em desenvolvimento e haverá ajustes futuros)


#### Explicando a gramatica 
- **PROG** : o programa inicia com uma declaração de variaveis e funções
- **ID** : Variaveis e funções
- **Tipo**: tipos de dados das variaveis e das funções
- **BLOCOS**: delimitadores utilizados para inicializar um bloco de código no programa
- **Operadores**: Op's usados para lógica e aritmética
- **Laços de controle**: 'if', 'else', 'while', 'for' (Ainda não aplicados na gramatica).


```antlr
grammar GramaticaInicial;

prog : dec;
dec : tipo ID ';'
    | tipo ID OE
    | tipo ID CE
    | tipo ID '{' lista_cmd '}' ;
tipo : 'int'
     | 'float'
     | 'void'
     | 'boolean'
     | 'long' ;
lista_cmd : lista_cmd comandos
          | comandos
comandos : expr
         | bloco;
bloco : '{' lista_cmd '}' ;
expr : ID ATRIB
     | ID ';' ;

ID : [a-zA-Z_][a-zA-Z0-9_]* ;
//Operadores
SUB : '-' ;
SUM : '+' ;
DIV : '/' ;
MULT : '*' ;
ATRIB : '=' ;
OE : '(' ;
CE : ')' ;



