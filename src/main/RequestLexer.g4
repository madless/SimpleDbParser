lexer grammar RequestLexer;

/*
 * Lexer Rules
 */

fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];

EOL : ';' ;
COMMA : ',' ;
ANY : '*' ;
OPEN_BRACKET : '(' ;
CLOSE_BRACKET : ')' ;

FROM : F R O M ;

SELECT : S E L E C T ;

WHERE : W H E R E ;

CREATE : C R E A T E ;

INSERT : I N S E R T ;

INTO : I N T O ;

VALUES : V A L U E S ;

TABLE : T A B L E ;

DROP : D R O P ;

IF_EXISTS : I F ' ' E X I S T S;

/* Types */

TYPE_TEXT : T E X T ;
TYPE_INT : I N T ;

WHITESPACE : ' ' -> skip ;

OPERATOR : '<' | '>' | '=' ;

LOGIC_OPERATOR :  ' AND ' | ' OR ';

VALUE : NUMBER | STRING;

NAME : LETTER CHARACTER* ;

STRING : ('"' CHARACTER*  '"') | ('\'' CHARACTER* '\'')  ;

NUMBER : [0-9]+ ;

DIGIT : [0-9] ;

CHARACTER : LETTER | DIGIT;

LETTER : [a-z]|[A-Z] ;