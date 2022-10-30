package org.intellij.sdk.language.psi;

import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import org.intellij.sdk.language.SimpleCobolFileType;
import org.intellij.sdk.language.SimpleCobolLanguage;
import org.jetbrains.annotations.NotNull;

public class SimpleCobolFile extends PsiFileBase {
    public SimpleCobolFile(@NotNull FileViewProvider viewProvider) {
        super(viewProvider, SimpleCobolLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public FileType getFileType() {
        return SimpleCobolFileType.INSTANCE;
    }

    @Override
    public String toString() {
        return "Simple Cobol File";
    }
}
