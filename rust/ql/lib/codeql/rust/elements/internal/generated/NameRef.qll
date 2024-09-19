// generated by codegen, do not edit
/**
 * This module provides the generated definition of `NameRef`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.AstNodeImpl::Impl as AstNodeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `NameRef` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::NameRef` class directly.
   * Use the subclass `NameRef`, where the following predicates are available.
   */
  class NameRef extends Synth::TNameRef, AstNodeImpl::AstNode {
    override string getAPrimaryQlClass() { result = "NameRef" }

    /**
     * Gets the text of this name reference, if it exists.
     */
    string getText() { result = Synth::convertNameRefToRaw(this).(Raw::NameRef).getText() }

    /**
     * Holds if `getText()` exists.
     */
    final predicate hasText() { exists(this.getText()) }
  }
}
