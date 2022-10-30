# Implementing COBOL language support for IntelliJ IDEA - test task

This project represents a simple plugin for Intellij IDEA that is capable of parsing a small subset of the COBOL language.

At the moment the following code fragment is being processed correctly:

```
PROGRAM-ID. HELLO.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-A PIC 9(2) VALUE 0.
```

## Limitations (= differences from real COBOL based on the above code snippet):

- All program names and identifiers must contain at least one letter; there are no differences between them in general
- All data types must have the form `PICCHAR\([0-9]\)`, for example `9(2)`
- Closes parsing in the `DATA DIVISION` is based on the fact that there are only two of them; `VALUE` can't exist without `PIC`, reverse situation is possible
- Only those of the form `0[1-9]` are supported as LEVEL_NUMBER
- It is assumed that integers do not have leading zeros

A more advanced lexer (more precisely, working with its state) is required to remove some restrictions.

__Note__: at the moment line numbering is not part of the code, but this will be fixed soon.

## Run plugin
1. Run ./gradlew runIde
2. Create a `test.scbl` file with the content above

__Note__: at the moment there are, unfortunately, no tests (time is the horrible thing!)