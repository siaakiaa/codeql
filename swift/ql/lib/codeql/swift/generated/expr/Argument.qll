// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `Argument`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.LocatableImpl::Impl as LocatableImpl

/**
 * INTERNAL: This module contains the fully generated definition of `Argument` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::Argument` class directly.
   * Use the subclass `Argument`, where the following predicates are available.
   */
  class Argument extends Synth::TArgument, LocatableImpl::Locatable {
    override string getAPrimaryQlClass() { result = "Argument" }

    /**
     * Gets the label of this argument.
     */
    string getLabel() { result = Synth::convertArgumentToRaw(this).(Raw::Argument).getLabel() }

    /**
     * Gets the expression of this argument.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Expr getImmediateExpr() {
      result =
        Synth::convertExprFromRaw(Synth::convertArgumentToRaw(this).(Raw::Argument).getExpr())
    }

    /**
     * Gets the expression of this argument.
     */
    final Expr getExpr() {
      exists(Expr immediate |
        immediate = this.getImmediateExpr() and
        result = immediate.resolve()
      )
    }
  }
}
