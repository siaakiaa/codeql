// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `InOutToPointerExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.internal.ImplicitConversionExprImpl::Impl as ImplicitConversionExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `InOutToPointerExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::InOutToPointerExpr` class directly.
   * Use the subclass `InOutToPointerExpr`, where the following predicates are available.
   */
  class InOutToPointerExpr extends Synth::TInOutToPointerExpr,
    ImplicitConversionExprImpl::ImplicitConversionExpr
  {
    override string getAPrimaryQlClass() { result = "InOutToPointerExpr" }
  }
}
