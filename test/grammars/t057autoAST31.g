grammar t057autoAST31;
options {language=Dart;output=AST;}

@header{part of dartlr_tests;}

a : ~'+'^ INT ;
ID : 'a'..'z'+ ;
INT : '0'..'9'+;
WS : (' '|'\n') {$channel = HIDDEN;} ;
