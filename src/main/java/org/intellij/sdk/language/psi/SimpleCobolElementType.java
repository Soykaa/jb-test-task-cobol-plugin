package org.intellij.sdk.language.psi;

import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.SimpleCobolLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class SimpleCobolElementType extends IElementType {
    public SimpleCobolElementType(@NotNull @NonNls String debugName) {
        super(debugName, SimpleCobolLanguage.INSTANCE);
    }
}
