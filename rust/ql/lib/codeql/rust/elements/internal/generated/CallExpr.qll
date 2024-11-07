// generated by codegen, do not edit
/**
 * This module provides the generated definition of `CallExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.CallExprBaseImpl::Impl as CallExprBaseImpl
import codeql.rust.elements.Expr

/**
 * INTERNAL: This module contains the fully generated definition of `CallExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A function call expression. For example:
   * ```rust
   * foo(42);
   * foo::<u32, u64>(42);
   * foo[0](42);
   * foo(1) = 4;
   * ```
   * INTERNAL: Do not reference the `Generated::CallExpr` class directly.
   * Use the subclass `CallExpr`, where the following predicates are available.
   */
  class CallExpr extends Synth::TCallExpr, CallExprBaseImpl::CallExprBase {
    override string getAPrimaryQlClass() { result = "CallExpr" }

    /**
     * Gets the expression of this call expression, if it exists.
     */
    Expr getExpr() {
      result =
        Synth::convertExprFromRaw(Synth::convertCallExprToRaw(this).(Raw::CallExpr).getExpr())
    }

    /**
     * Holds if `getExpr()` exists.
     */
    final predicate hasExpr() { exists(this.getExpr()) }
  }
}
