// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `SubscriptExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Argument
import codeql.swift.elements.expr.LookupExprImpl::Impl as LookupExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `SubscriptExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::SubscriptExpr` class directly.
   * Use the subclass `SubscriptExpr`, where the following predicates are available.
   */
  class SubscriptExpr extends Synth::TSubscriptExpr, LookupExprImpl::LookupExpr {
    override string getAPrimaryQlClass() { result = "SubscriptExpr" }

    /**
     * Gets the `index`th argument of this subscript expression (0-based).
     */
    Argument getArgument(int index) {
      result =
        Synth::convertArgumentFromRaw(Synth::convertSubscriptExprToRaw(this)
              .(Raw::SubscriptExpr)
              .getArgument(index))
    }

    /**
     * Gets any of the arguments of this subscript expression.
     */
    final Argument getAnArgument() { result = this.getArgument(_) }

    /**
     * Gets the number of arguments of this subscript expression.
     */
    final int getNumberOfArguments() { result = count(int i | exists(this.getArgument(i))) }

    /**
     * Holds if this subscript expression has direct to storage semantics.
     */
    predicate hasDirectToStorageSemantics() {
      Synth::convertSubscriptExprToRaw(this).(Raw::SubscriptExpr).hasDirectToStorageSemantics()
    }

    /**
     * Holds if this subscript expression has direct to implementation semantics.
     */
    predicate hasDirectToImplementationSemantics() {
      Synth::convertSubscriptExprToRaw(this)
          .(Raw::SubscriptExpr)
          .hasDirectToImplementationSemantics()
    }

    /**
     * Holds if this subscript expression has ordinary semantics.
     */
    predicate hasOrdinarySemantics() {
      Synth::convertSubscriptExprToRaw(this).(Raw::SubscriptExpr).hasOrdinarySemantics()
    }

    /**
     * Holds if this subscript expression has distributed thunk semantics.
     */
    predicate hasDistributedThunkSemantics() {
      Synth::convertSubscriptExprToRaw(this).(Raw::SubscriptExpr).hasDistributedThunkSemantics()
    }
  }
}
