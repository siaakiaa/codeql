// generated by codegen, do not edit
/**
 * This module provides the generated definition of `TokenTree`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.AstNodeImpl::Impl as AstNodeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `TokenTree` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A TokenTree. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::TokenTree` class directly.
   * Use the subclass `TokenTree`, where the following predicates are available.
   */
  class TokenTree extends Synth::TTokenTree, AstNodeImpl::AstNode {
    override string getAPrimaryQlClass() { result = "TokenTree" }
  }
}
