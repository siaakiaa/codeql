// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `ConsumeExpr`.
 */

private import ConsumeExprImpl
import codeql.swift.elements.expr.Expr

/**
 * An expression that forces value to be moved. In the example below, `consume` marks the move expression:
 *
 * ```
 * let y = ...
 * let x = consume y
 * ```
 */
final class ConsumeExpr = Impl::ConsumeExpr;
