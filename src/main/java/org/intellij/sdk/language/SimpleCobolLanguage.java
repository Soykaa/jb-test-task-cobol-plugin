package org.intellij.sdk.language;

import com.intellij.lang.Language;

public class SimpleCobolLanguage extends Language {
    public static final SimpleCobolLanguage INSTANCE = new SimpleCobolLanguage();

    private SimpleCobolLanguage() {
        super("SimpleCobol");
    }
}
