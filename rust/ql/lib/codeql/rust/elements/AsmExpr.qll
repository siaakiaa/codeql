// generated by codegen, do not edit
/**
 * This module provides the public class `AsmExpr`.
 */

private import internal.AsmExprImpl
import codeql.rust.elements.AsmPiece
import codeql.rust.elements.Attr
import codeql.rust.elements.Expr

/**
 * An inline assembly expression. For example:
 * ```rust
 * unsafe {
 *     builtin # asm(_);
 * }
 * ```
 */
final class AsmExpr = Impl::AsmExpr;
