// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `BraceStmt`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.AstNode
import codeql.swift.elements.stmt.StmtImpl::Impl as StmtImpl
import codeql.swift.elements.decl.VarDecl

/**
 * INTERNAL: This module contains the fully generated definition of `BraceStmt` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::BraceStmt` class directly.
   * Use the subclass `BraceStmt`, where the following predicates are available.
   */
  class BraceStmt extends Synth::TBraceStmt, StmtImpl::Stmt {
    override string getAPrimaryQlClass() { result = "BraceStmt" }

    /**
     * Gets the `index`th variable declared in the scope of this brace statement (0-based).
     */
    VarDecl getVariable(int index) { none() }

    /**
     * Gets any of the variables declared in the scope of this brace statement.
     */
    final VarDecl getAVariable() { result = this.getVariable(_) }

    /**
     * Gets the number of variables declared in the scope of this brace statement.
     */
    final int getNumberOfVariables() { result = count(int i | exists(this.getVariable(i))) }

    /**
     * Gets the `index`th element of this brace statement (0-based).
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    AstNode getImmediateElement(int index) {
      result =
        Synth::convertAstNodeFromRaw(Synth::convertBraceStmtToRaw(this)
              .(Raw::BraceStmt)
              .getElement(index))
    }

    /**
     * Gets the `index`th element of this brace statement (0-based).
     */
    final AstNode getElement(int index) {
      exists(AstNode immediate |
        immediate = this.getImmediateElement(index) and
        result = immediate.resolve()
      )
    }

    /**
     * Gets any of the elements of this brace statement.
     */
    final AstNode getAnElement() { result = this.getElement(_) }

    /**
     * Gets the number of elements of this brace statement.
     */
    final int getNumberOfElements() { result = count(int i | exists(this.getElement(i))) }
  }
}
