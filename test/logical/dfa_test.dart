// Copyright (c) 2012, the ANTLR Dart backend project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library DFA_test;

import "package:unittest/unittest.dart";
import "package:dartlr/dartlr.dart";

main() {  
  
  List<String> encodedStrings = <String>[
    "\u003d\uffff",
    "\u0001\u0039\u0001\u003a\u0002\uffff\u0001\u003b\u0012\uffff"
    "\u0001\u0038\u000e\uffff\u0001\u0013\u000a\uffff\u0001\u001f\u0003"
    "\uffff\u0001\u0012\u0002\uffff\u001a\u001f\u0004\uffff\u0001\u001f"
    "\u0001\uffff\u001a\u001f",
    "\u0001\u003c\u0011\u0009\u0002\uffff\u0012\u0009\u0002\u0000\u000b"
    "\u0009\u0001\u0000\u0001\u0009\u0001\u0000\u0007\u0009",
    "\u0001\u003c\u0011\u007a\u0002\uffff\u000a\u007a\u0001\u0027\u0003"
    "\u007a\u0004\u0027\u0002\uffff\u0006\u007a\u0004\u003d\u0001\u0027"
    "\u0001\uffff\u0001\u007a\u0001\uffff\u0001\u007a\u0001\u003d\u0005"
    "\u007a",
    "\u0001\uffff\u0001\u0030\u0001\u0032\u0001\u0035\u0002\uffff\u0001"
    "\u0037\u0001\u003a\u0001\uffff\u0001\u003e\u0001\u0040\u0001\u0045"
    "\u0002\uffff\u0001\u0048\u0001\u004a\u0001\u004d\u0003\uffff\u0001"
    "\u004f\u000f\u0028\u0001\uffff\u0001\u006b\u0005\uffff\u0002\u006d"
    "\u0019\uffff\u0001\u0071\u0005\uffff\u0001\u0073\u0003\uffff\u0006"
    "\u0028\u0001\u007b\u0006\u0028\u0001\u0082\u000b\u0028\u0005\uffff"
    "\u0001\u0093\u0001\u006d\u0004\uffff\u0007\u0028\u0001\uffff\u0004"
    "\u0028\u0001\u00a0\u0001\u0028\u0001\uffff\u0001\u00a2\u000f\u0028"
    "\u0001\uffff\u0001\u00b2\u0001\u0028\u0001\u00b4\u0001\u00b5\u0004"
    "\u0028\u0001\u00ba\u0001\u00bb\u0002\u0028\u0001\uffff\u0001\u00be"
    "\u0001\uffff\u0001\u00bf\u000b\u0028\u0001\u00cb\u0002\u0028\u0001"
    "\uffff\u0001\u00ce\u0002\uffff\u0001\u00cf\u0003\u0028\u0002\uffff"
    "\u0001\u0028\u0001\u00d4\u0002\uffff\u0002\u0028\u0001\u00d7\u0006"
    "\u0028\u0001\u00de\u0001\u0028\u0001\uffff\u0001\u0028\u0001\u00e1"
    "\u0002\uffff\u0002\u0028\u0001\u00e4\u0001\u00e5\u0001\uffff\u0001"
    "\u0028\u0001\u00e7\u0001\uffff\u0001\u00e8\u0001\u00e9\u0001\u00ea"
    "\u0001\u00eb\u0001\u00ec\u0001\u0028\u0001\uffff\u0002\u0028\u0001"
    "\uffff\u0001\u0028\u0001\u00f1\u0002\uffff\u0001\u0028\u0006\uffff"
    "\u0001\u00f3\u0002\u0028\u0001\u00f6\u0001\uffff\u0001\u00f7\u0001"
    "\uffff\u0001\u00f8\u0001\u00f9\u0004\uffff"
  ];
  
  List<List<int>> expectedIntLists = <List<int>>[
     <int>[
       -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
       -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
       -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
       -1, -1, -1, -1, -1, -1, -1
     ],
     <int>[
       57,58,-1,-1,59,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
       56,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,19,-1,-1,-1,-1,-1,-1,-1,
       -1,-1,-1,31,-1,-1,-1,18,-1,-1,31,31,31,31,31,31,31,31,31,31,31,31,31,
       31,31,31,31,31,31,31,31,31,31,31,31,31,-1,-1,-1,-1,31,-1,31,31,31,31,
       31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31
     ],
     <int>[
       60,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,-1,-1,9,9,9,9,9,9,9,9,9,9,9,9,9,9,
       9,9,9,9,0,0,9,9,9,9,9,9,9,9,9,9,9,0,9,0,9,9,9,9,9,9,9
     ],
     <int>[
       60,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,
       -1,-1,122,122,122,122,122,122,122,122,122,122,39,122,122,122,39,39,39,
       39,-1,-1,122,122,122,122,122,122,61,61,61,61,39,-1,122,-1,122,61,122,
       122,122,122,122
     ],
     <int>[
       -1,48,50,53,-1,-1,55,58,-1,62,64,69,-1,-1,72,74,77,-1,-1,-1,79,40,40,
       40,40,40,40,40,40,40,40,40,40,40,40,40,-1,107,-1,-1,-1,-1,-1,109,109,
       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
       -1,-1,113,-1,-1,-1,-1,-1,115,-1,-1,-1,40,40,40,40,40,40,123,40,40,40,
       40,40,40,130,40,40,40,40,40,40,40,40,40,40,40,-1,-1,-1,-1,-1,147,109,
       -1,-1,-1,-1,40,40,40,40,40,40,40,-1,40,40,40,40,160,40,-1,162,40,40,40,
       40,40,40,40,40,40,40,40,40,40,40,40,-1,178,40,180,181,40,40,40,40,186,
       187,40,40,-1,190,-1,191,40,40,40,40,40,40,40,40,40,40,40,203,40,40,-1,
       206,-1,-1,207,40,40,40,-1,-1,40,212,-1,-1,40,40,215,40,40,40,40,40,40,
       222,40,-1,40,225,-1,-1,40,40,228,229,-1,40,231,-1,232,233,234,235,236,
       40,-1,40,40,-1,40,241,-1,-1,40,-1,-1,-1,-1,-1,-1,243,40,40,246,-1,247,
       -1,248,249,-1,-1,-1,-1
     ]
  ];
  
  List<List<int>> expectedUnsignedIntLists = <List<int>>[
    <int>[
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,
      65535
    ],                                                     
    <int>[
      57,58,65535,65535,59,65535,65535,65535,65535,65535,65535,65535,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,56,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,
      65535,19,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,31,
      65535,65535,65535,18,65535,65535,31,31,31,31,31,31,31,31,31,31,31,31,31,
      31,31,31,31,31,31,31,31,31,31,31,31,31,65535,65535,65535,65535,31,65535,
      31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,
      31, 31
    ],                                                     
    <int>[
      60,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,65535,65535,9,9,9,9,9,9,9,9,9,9,9,
      9,9,9,9,9,9,9,0,0,9,9,9,9,9,9,9,9,9,9,9,0,9,0,9,9,9,9,9,9,9
    ],
    <int>[
      60,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,
      65535,65535,122,122,122,122,122,122,122,122,122,122,39,122,122,122,39,39,
      39,39,65535,65535,122,122,122,122,122,122,61,61,61,61,39,65535,122,65535,
      122,61,122,122,122,122,122
    ],
    <int>[
      65535,48,50,53,65535,65535,55,58,65535,62,64,69,65535,65535,72,74,77,
      65535,65535,65535,79,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,65535,
      107,65535,65535,65535,65535,65535,109,109,65535,65535,65535,65535,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,65535,
      65535,65535,65535,65535,65535,65535,65535,65535,113,65535,65535,65535,
      65535,65535,115,65535,65535,65535,40,40,40,40,40,40,123,40,40,40,40,40,
      40,130,40,40,40,40,40,40,40,40,40,40,40,65535,65535,65535,65535,65535,
      147,109,65535,65535,65535,65535,40,40,40,40,40,40,40,65535,40,40,40,40,
      160,40,65535,162,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,65535,178,
      40,180,181,40,40,40,40,186,187,40,40,65535,190,65535,191,40,40,40,40,40,
      40,40,40,40,40,40,203,40,40,65535,206,65535,65535,207,40,40,40,65535,
      65535,40,212,65535,65535,40,40,215,40,40,40,40,40,40,222,40,65535,40,
      225,65535,65535,40,40,228,229,65535,40,231,65535,232,233,234,235,236,
      40,65535,40,40,65535,40,241,65535,65535,40,65535,65535,65535,65535,
      65535,65535,243,40,40,246,65535,247,65535,248,249,65535,65535,65535,65535
    ]
  ];
  
  test('testUnpackEncodedString', () {
    Iterator<List<int>> it = expectedIntLists.iterator();
    for(String encodedString in  encodedStrings) {
      List<int> unpackedList = DFA.unpackEncodedString(encodedString);
      expect(unpackedList, equals(it.next()));
    }
  });
  
  test("testUnpackEncodedStringToUnsignedChars", () {
    Iterator<List<int>> it = expectedUnsignedIntLists.iterator();
    for(String encodedString in  encodedStrings) {
      List<int> unpackedList = 
          DFA.unpackEncodedStringToUnsignedChars(encodedString);
      expect(unpackedList, equals(it.next()));
    }
  });  
}
