// @@ANTLR Tool Options@@: -trace
grammar t044trace;
options {
  language = Dart;
}

@header{part of dartlr_tests;}

a: '<' ((INT '+')=>b|c) '>';
b: c ('+' c)*;
c: INT;

INT: ('0'..'9')+;
WS: (' ' | '\n' | '\t')+ {$channel = HIDDEN;};
