// generated by codegen, do not edit
/**
 * This module provides the public class `ConstExpr`.
 */

private import ConstExprImpl
import codeql.rust.elements.Expr

/**
 * A `const` block expression. For example:
 * ```
 * if const { SRC::IS_ZST || DEST::IS_ZST || mem::align_of::<SRC>() != mem::align_of::<DEST>() } {
 *     return false;
 * }
 * ```
 */
final class ConstExpr = Impl::ConstExpr;
