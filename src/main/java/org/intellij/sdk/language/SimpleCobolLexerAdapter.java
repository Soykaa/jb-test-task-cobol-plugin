package org.intellij.sdk.language;

import com.intellij.lexer.FlexAdapter;

public class SimpleCobolLexerAdapter extends FlexAdapter {
    public SimpleCobolLexerAdapter() {
        super(new SimpleCobolLexer(null));
    }
}
