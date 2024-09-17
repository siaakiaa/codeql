// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `IdentityExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.expr.ExprImpl::Impl as ExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `IdentityExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::IdentityExpr` class directly.
   * Use the subclass `IdentityExpr`, where the following predicates are available.
   */
  class IdentityExpr extends Synth::TIdentityExpr, ExprImpl::Expr {
    /**
     * Gets the sub expression of this identity expression.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Expr getImmediateSubExpr() {
      result =
        Synth::convertExprFromRaw(Synth::convertIdentityExprToRaw(this)
              .(Raw::IdentityExpr)
              .getSubExpr())
    }

    /**
     * Gets the sub expression of this identity expression.
     */
    final Expr getSubExpr() {
      exists(Expr immediate |
        immediate = this.getImmediateSubExpr() and
        if exists(this.getResolveStep()) then result = immediate else result = immediate.resolve()
      )
    }
  }
}
