// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `TapExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.stmt.BraceStmt
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.expr.ExprImpl::Impl as ExprImpl
import codeql.swift.elements.decl.VarDecl

/**
 * INTERNAL: This module contains the fully generated definition of `TapExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::TapExpr` class directly.
   * Use the subclass `TapExpr`, where the following predicates are available.
   */
  class TapExpr extends Synth::TTapExpr, ExprImpl::Expr {
    override string getAPrimaryQlClass() { result = "TapExpr" }

    /**
     * Gets the sub expression of this tap expression, if it exists.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Expr getImmediateSubExpr() {
      result =
        Synth::convertExprFromRaw(Synth::convertTapExprToRaw(this).(Raw::TapExpr).getSubExpr())
    }

    /**
     * Gets the sub expression of this tap expression, if it exists.
     */
    final Expr getSubExpr() {
      exists(Expr immediate |
        immediate = this.getImmediateSubExpr() and
        if exists(this.getResolveStep()) then result = immediate else result = immediate.resolve()
      )
    }

    /**
     * Holds if `getSubExpr()` exists.
     */
    final predicate hasSubExpr() { exists(this.getSubExpr()) }

    /**
     * Gets the body of this tap expression.
     */
    BraceStmt getBody() {
      result =
        Synth::convertBraceStmtFromRaw(Synth::convertTapExprToRaw(this).(Raw::TapExpr).getBody())
    }

    /**
     * Gets the variable of this tap expression.
     */
    VarDecl getVar() {
      result =
        Synth::convertVarDeclFromRaw(Synth::convertTapExprToRaw(this).(Raw::TapExpr).getVar())
    }
  }
}
