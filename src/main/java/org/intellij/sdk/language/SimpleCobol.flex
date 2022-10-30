package org.intellij.sdk.language;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.psi.SimpleCobolTypes;
import com.intellij.psi.TokenType;

%%

%class SimpleCobolLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%eof{  return;
%eof}

WHITESPACE                 = \s
DEL                        = \n\r
QUOTE                      = \'
LEFT_PAREN                 = \(
RIGHT_PAREN                = \)
USER_DEFINED_WORD          = ([0-9]+ [\-]*)* [0-9]* [A-Za-z] [A-Za-z0-9]* ([\-]+ [A-Za-z0-9]+)*
LEVEL_NUMBER               = 0[1-9]
NUMERIC                    = [\+\-]?([0-9]*[\.][0-9]+|0|[1-9][0-9]*)
DATATYPE                   = [ABEGPSVXZabegpsvxz90\+\-\*\$]{LEFT_PAREN}[0-9]+{RIGHT_PAREN}
FIGURATIVE_CONSTANT        = {QUOTE}

%%

    <YYINITIAL> {
      "IDENTIFICATION"             { return SimpleCobolTypes.IDENTIFICATION; }
      "DIVISION"                   { return SimpleCobolTypes.DIVISION; }
      "."                          { return SimpleCobolTypes.DOT; }
      "DATA"                       { return SimpleCobolTypes.DATA; }
      "PROGRAM-ID"                 { return SimpleCobolTypes.PROGRAM_ID; }
      "WORKING-STORAGE"            { return SimpleCobolTypes.WORKING_STORAGE; }
      "SECTION"                    { return SimpleCobolTypes.SECTION; }
      "PIC"                        { return SimpleCobolTypes.PIC; }
      "VALUE"                      { return SimpleCobolTypes.VALUE; }
      {DEL}                        { return SimpleCobolTypes.DEL; }
      {WHITESPACE}                 { return SimpleCobolTypes.WS; }
      {USER_DEFINED_WORD}          { return SimpleCobolTypes.USER_DEFINED_WORD; }
      {LEVEL_NUMBER}               { return SimpleCobolTypes.LEVEL_NUMBER; }
      {NUMERIC}                    { return SimpleCobolTypes.NUMERIC; }
      {DATATYPE}                   { return SimpleCobolTypes.DATATYPE; }
    }

    [^]                            { return TokenType.BAD_CHARACTER; }