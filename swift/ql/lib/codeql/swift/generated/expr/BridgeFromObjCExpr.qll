// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `BridgeFromObjCExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.ImplicitConversionExprImpl::Impl as ImplicitConversionExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `BridgeFromObjCExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::BridgeFromObjCExpr` class directly.
   * Use the subclass `BridgeFromObjCExpr`, where the following predicates are available.
   */
  class BridgeFromObjCExpr extends Synth::TBridgeFromObjCExpr,
    ImplicitConversionExprImpl::ImplicitConversionExpr
  {
    override string getAPrimaryQlClass() { result = "BridgeFromObjCExpr" }
  }
}
