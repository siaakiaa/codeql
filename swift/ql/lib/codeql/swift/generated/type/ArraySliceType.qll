// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `ArraySliceType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.UnarySyntaxSugarTypeImpl::Impl as UnarySyntaxSugarTypeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `ArraySliceType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::ArraySliceType` class directly.
   * Use the subclass `ArraySliceType`, where the following predicates are available.
   */
  class ArraySliceType extends Synth::TArraySliceType,
    UnarySyntaxSugarTypeImpl::UnarySyntaxSugarType
  {
    override string getAPrimaryQlClass() { result = "ArraySliceType" }
  }
}
