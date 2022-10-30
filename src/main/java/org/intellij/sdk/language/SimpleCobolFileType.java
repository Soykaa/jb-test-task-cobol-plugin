package org.intellij.sdk.language;


import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;

public class SimpleCobolFileType extends LanguageFileType {
    public static final SimpleCobolFileType INSTANCE = new SimpleCobolFileType();

    private SimpleCobolFileType() {
        super(SimpleCobolLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public String getName() {
        return "Simple Cobol File";
    }

    @NotNull
    @Override
    public String getDescription() {
        return "Simple Cobol language file";
    }

    @NotNull
    @Override
    public String getDefaultExtension() {
        return "scbl";
    }

    @Nullable
    @Override
    public Icon getIcon() {
        return SimpleCobolIcons.FILE;
    }
}
