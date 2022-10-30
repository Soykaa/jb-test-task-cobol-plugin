package org.intellij.sdk.language.psi;

import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.SimpleCobolLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class SimpleCobolTokenType extends IElementType {
    public SimpleCobolTokenType(@NotNull @NonNls String debugName) {
        super(debugName, SimpleCobolLanguage.INSTANCE);
    }

    @Override
    public String toString() {
        return "SimpleCobolTokenType." + super.toString();
    }
}
