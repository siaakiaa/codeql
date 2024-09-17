// generated by codegen, do not edit
/**
 * This module provides the public class `MatchArm`.
 */

private import MatchArmImpl
import codeql.rust.elements.AstNode
import codeql.rust.elements.Expr
import codeql.rust.elements.Pat

/**
 * A match arm. For example:
 * ```
 * match x {
 *     Option::Some(y) => y,
 *     Option::None => 0,
 * };
 * ```
 * ```
 * match x {
 *     Some(y) if y != 0 => 1 / y,
 *     _ => 0,
 * };
 * ```
 */
final class MatchArm = Impl::MatchArm;
