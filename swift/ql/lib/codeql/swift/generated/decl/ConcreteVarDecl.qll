// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `ConcreteVarDecl`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.decl.VarDeclImpl::Impl as VarDeclImpl

/**
 * INTERNAL: This module contains the fully generated definition of `ConcreteVarDecl` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::ConcreteVarDecl` class directly.
   * Use the subclass `ConcreteVarDecl`, where the following predicates are available.
   */
  class ConcreteVarDecl extends Synth::TConcreteVarDecl, VarDeclImpl::VarDecl {
    override string getAPrimaryQlClass() { result = "ConcreteVarDecl" }

    /**
     * Gets the introducer enumeration value.
     *
     * This is 0 if the variable was introduced with `let` and 1 if it was introduced with `var`.
     */
    int getIntroducerInt() {
      result = Synth::convertConcreteVarDeclToRaw(this).(Raw::ConcreteVarDecl).getIntroducerInt()
    }
  }
}
