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
DEL                        = \n
QUOTE                      = \'
LEFT_PAREN                 = \(
RIGHT_PAREN                = \)
USER_DEFINED_WORD          = ([0-9]+ [\-]*)*[0-9]*[A-Za-z][A-Za-z0-9]*([\-]+[A-Za-z0-9]+)*
LINE                       = [0-9][0-9]
NUMERIC                    = [\+\-]?([0-9]*[\.][0-9]+|[0-9]+)
PICCHAR                    = ([ABEGPSVXZabegpsvxz90\+\-\*\$]|"CR"| "DB")
REPEAT                     = {LEFT_PAREN}[0-9]+{RIGHT_PAREN}
FIGURATIVE_CONSTANT        = {QUOTE}
EQUAL                      = =
LEVEL_NUMBER               = ([0]?[1-9]|[1-4][0-9]|"66"| "77"|"88")

%state WAITING_NUMERIC WAITING_BASIS WAITING_LEVEL

%%

      {DEL}                                                         { yybegin(YYINITIAL); return SimpleCobolTypes.DEL; }

      <YYINITIAL, WAITING_LEVEL> "IDENTIFICATION"                   { yybegin(YYINITIAL); return SimpleCobolTypes.IDENTIFICATION; }
      <YYINITIAL> "DIVISION"                                        { yybegin(YYINITIAL); return SimpleCobolTypes.DIVISION; }
      <YYINITIAL> "."                                               { yybegin(YYINITIAL); return SimpleCobolTypes.DOT; }
      <YYINITIAL, WAITING_LEVEL> "DATA"                             { yybegin(YYINITIAL); return SimpleCobolTypes.DATA; }
      <YYINITIAL, WAITING_LEVEL> "PROGRAM-ID"                       { yybegin(YYINITIAL); return SimpleCobolTypes.PROGRAM_ID; }
      <YYINITIAL, WAITING_LEVEL> "WORKING-STORAGE"                  { yybegin(YYINITIAL); return SimpleCobolTypes.WORKING_STORAGE; }
      <YYINITIAL> "SECTION"                                         { yybegin(YYINITIAL); return SimpleCobolTypes.SECTION; }
      <YYINITIAL> "PIC"                                             { yybegin(YYINITIAL); return SimpleCobolTypes.PIC; }
      <YYINITIAL, WAITING_LEVEL> "PROCEDURE"                        { yybegin(YYINITIAL); return SimpleCobolTypes.PROCEDURE; }
      <YYINITIAL, WAITING_LEVEL> "STOP"                             { yybegin(YYINITIAL); return SimpleCobolTypes.STOP; }
      <YYINITIAL> "RUN"                                             { yybegin(YYINITIAL); return SimpleCobolTypes.RUN; }
      <YYINITIAL, WAITING_LEVEL> "DISPLAY"                          { yybegin(YYINITIAL); return SimpleCobolTypes.DISPLAY; }
      <YYINITIAL, WAITING_LEVEL> "PERFORM"                          { yybegin(YYINITIAL); return SimpleCobolTypes.PERFORM; }
      <YYINITIAL> "VARYING"                                         { yybegin(YYINITIAL); return SimpleCobolTypes.VARYING; }
      <YYINITIAL> "UNTIL"                                           { yybegin(YYINITIAL); return SimpleCobolTypes.UNTIL; }
      <YYINITIAL> "VALUE"                                           { yybegin(WAITING_NUMERIC); return SimpleCobolTypes.VALUE; }
      <YYINITIAL> "FROM"                                            { yybegin(WAITING_NUMERIC); return SimpleCobolTypes.FROM; }
      <YYINITIAL> "BY"                                              { yybegin(WAITING_NUMERIC); return SimpleCobolTypes.BY; }
      <YYINITIAL> {LINE}                                            { yybegin(WAITING_LEVEL); return SimpleCobolTypes.LINE; }
      <YYINITIAL> {PICCHAR}                                         { yybegin(YYINITIAL); return SimpleCobolTypes.PICCHAR; }
      <YYINITIAL> {REPEAT}                                          { yybegin(YYINITIAL); return SimpleCobolTypes.REPEAT; }
      <YYINITIAL> {FIGURATIVE_CONSTANT}                             { yybegin(YYINITIAL); return SimpleCobolTypes.FIGURATIVE_CONSTANT ; }
      <YYINITIAL> {EQUAL}                                           { yybegin(WAITING_BASIS); return SimpleCobolTypes.EQUAL; }
      <WAITING_LEVEL> {LEVEL_NUMBER}                                { yybegin(YYINITIAL); return SimpleCobolTypes.LEVEL_NUMBER; }
      <YYINITIAL, WAITING_BASIS, WAITING_LEVEL> {USER_DEFINED_WORD} { yybegin(YYINITIAL); return SimpleCobolTypes.USER_DEFINED_WORD; }
      <WAITING_BASIS, WAITING_NUMERIC> {NUMERIC}                    { yybegin(YYINITIAL); return SimpleCobolTypes.NUMERIC; }

      {WHITESPACE}                                                  { return TokenType.WHITE_SPACE; }
      [^]                                                           { return TokenType.BAD_CHARACTER; }