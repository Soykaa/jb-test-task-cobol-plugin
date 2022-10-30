# Implementing COBOL language support for IntelliJ IDEA: test task

This project represents a simple plugin for Intellij IDEA that is capable of parsing a small subset of the COBOL language.
Inspired by [this grammar](https://www.cs.vu.nl/~x/grammars/vs-cobol-ii/index.html).

The following code fragment is being processed correctly:

```
01 IDENTIFICATION DIVISION.
02 PROGRAM-ID. HELLO.
03 DATA DIVISION.
04 WORKING-STORAGE SECTION.
05 01 WS-A PIC 9(2) VALUE 0.
06 PROCEDURE DIVISION.
07 A-PARA.
08 PERFORM B-PARA VARYING WS-A FROM 2 BY 2 UNTIL WS-A=12
09 STOP RUN.
10 B-PARA.
11 DISPLAY 'B-PARA ' WS-A.
12 DISPLAY 'B-PARA'.
```

## Limitations (= differences from real COBOL based on the above code snippet):

- All program names and identifiers must contain at least one letter; there are no differences between them in general
- For convenience, all _picture-string_-s are simplified to `(PICCHAR+ REPEAT?)+` instead of the original one
- Closes parsing in the `DATA DIVISION` is based on the fact that there are only two of them; `VALUE` can't exist without `PIC`, reverse situation is possible
- Values in this task can be only numeric
- Literals and conditions are also different from the documentation, but it's enough

For details see _SimpleCobol.bnf_ & _SimpleCobol.flex!_

## Run plugin
0. Generate parser and lexer (very sorry!)
1. Run `./gradlew runIde`
2. Create a _test.scbl_ file with the content above
3. You are great! Now you can even build a tree via PsiViewer.

__Note__: such file extension was chosen because this is not COBOL actually :)