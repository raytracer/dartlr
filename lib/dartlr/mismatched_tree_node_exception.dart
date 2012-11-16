// Copyright (c) 2012, the ANTLR Dart backend project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of dartlr;

class MismatchedTreeNodeException extends RecognitionException {
  
  int expecting;

  MismatchedTreeNodeException([this.expecting, TreeNodeStream input]) : super(input);

  String toString() => "MismatchedTreeNodeException(${unexpectedType} != $expecting)";
  
}

