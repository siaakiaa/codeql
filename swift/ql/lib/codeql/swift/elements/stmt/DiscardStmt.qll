// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `DiscardStmt`.
 */

private import DiscardStmtImpl
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.stmt.Stmt

/**
 * A statement that takes a non-copyable value and destructs its members/fields.
 *
 * The only valid syntax:
 * ```
 * destruct self
 * ```
 */
final class DiscardStmt = Impl::DiscardStmt;
