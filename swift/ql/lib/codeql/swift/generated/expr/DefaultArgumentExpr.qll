// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `DefaultArgumentExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.expr.ExprImpl::Impl as ExprImpl
import codeql.swift.elements.decl.ParamDecl

/**
 * INTERNAL: This module contains the fully generated definition of `DefaultArgumentExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::DefaultArgumentExpr` class directly.
   * Use the subclass `DefaultArgumentExpr`, where the following predicates are available.
   */
  class DefaultArgumentExpr extends Synth::TDefaultArgumentExpr, ExprImpl::Expr {
    override string getAPrimaryQlClass() { result = "DefaultArgumentExpr" }

    /**
     * Gets the parameter declaration of this default argument expression.
     */
    ParamDecl getParamDecl() {
      result =
        Synth::convertParamDeclFromRaw(Synth::convertDefaultArgumentExprToRaw(this)
              .(Raw::DefaultArgumentExpr)
              .getParamDecl())
    }

    /**
     * Gets the parameter index of this default argument expression.
     */
    int getParamIndex() {
      result =
        Synth::convertDefaultArgumentExprToRaw(this).(Raw::DefaultArgumentExpr).getParamIndex()
    }

    /**
     * Gets the caller side default of this default argument expression, if it exists.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Expr getImmediateCallerSideDefault() {
      result =
        Synth::convertExprFromRaw(Synth::convertDefaultArgumentExprToRaw(this)
              .(Raw::DefaultArgumentExpr)
              .getCallerSideDefault())
    }

    /**
     * Gets the caller side default of this default argument expression, if it exists.
     */
    final Expr getCallerSideDefault() {
      exists(Expr immediate |
        immediate = this.getImmediateCallerSideDefault() and
        if exists(this.getResolveStep()) then result = immediate else result = immediate.resolve()
      )
    }

    /**
     * Holds if `getCallerSideDefault()` exists.
     */
    final predicate hasCallerSideDefault() { exists(this.getCallerSideDefault()) }
  }
}
