// generated by codegen, do not edit
/**
 * This module provides the generated definition of `OffsetOfExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.Attr
import codeql.rust.elements.internal.ExprImpl::Impl as ExprImpl
import codeql.rust.elements.NameRef
import codeql.rust.elements.TypeRef

/**
 * INTERNAL: This module contains the fully generated definition of `OffsetOfExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::OffsetOfExpr` class directly.
   * Use the subclass `OffsetOfExpr`, where the following predicates are available.
   */
  class OffsetOfExpr extends Synth::TOffsetOfExpr, ExprImpl::Expr {
    override string getAPrimaryQlClass() { result = "OffsetOfExpr" }

    /**
     * Gets the `index`th attr of this offset of expression (0-based).
     */
    Attr getAttr(int index) {
      result =
        Synth::convertAttrFromRaw(Synth::convertOffsetOfExprToRaw(this)
              .(Raw::OffsetOfExpr)
              .getAttr(index))
    }

    /**
     * Gets any of the attrs of this offset of expression.
     */
    final Attr getAnAttr() { result = this.getAttr(_) }

    /**
     * Gets the number of attrs of this offset of expression.
     */
    final int getNumberOfAttrs() { result = count(int i | exists(this.getAttr(i))) }

    /**
     * Gets the `index`th field of this offset of expression (0-based).
     */
    NameRef getField(int index) {
      result =
        Synth::convertNameRefFromRaw(Synth::convertOffsetOfExprToRaw(this)
              .(Raw::OffsetOfExpr)
              .getField(index))
    }

    /**
     * Gets any of the fields of this offset of expression.
     */
    final NameRef getAField() { result = this.getField(_) }

    /**
     * Gets the number of fields of this offset of expression.
     */
    final int getNumberOfFields() { result = count(int i | exists(this.getField(i))) }

    /**
     * Gets the ty of this offset of expression, if it exists.
     */
    TypeRef getTy() {
      result =
        Synth::convertTypeRefFromRaw(Synth::convertOffsetOfExprToRaw(this)
              .(Raw::OffsetOfExpr)
              .getTy())
    }

    /**
     * Holds if `getTy()` exists.
     */
    final predicate hasTy() { exists(this.getTy()) }
  }
}
