// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `TopLevelCodeDecl`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.stmt.BraceStmt
import codeql.swift.elements.decl.DeclImpl::Impl as DeclImpl

/**
 * INTERNAL: This module contains the fully generated definition of `TopLevelCodeDecl` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::TopLevelCodeDecl` class directly.
   * Use the subclass `TopLevelCodeDecl`, where the following predicates are available.
   */
  class TopLevelCodeDecl extends Synth::TTopLevelCodeDecl, DeclImpl::Decl {
    override string getAPrimaryQlClass() { result = "TopLevelCodeDecl" }

    /**
     * Gets the body of this top level code declaration.
     */
    BraceStmt getBody() {
      result =
        Synth::convertBraceStmtFromRaw(Synth::convertTopLevelCodeDeclToRaw(this)
              .(Raw::TopLevelCodeDecl)
              .getBody())
    }
  }
}
