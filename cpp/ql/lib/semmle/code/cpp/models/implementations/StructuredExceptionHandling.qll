import semmle.code.cpp.models.interfaces.Throwing

class WindowsDriverExceptionAnnotation extends ThrowingFunction {
  WindowsDriverExceptionAnnotation() {
    this.hasGlobalName(["RaiseException", "ExRaiseAccessViolation", "ExRaiseDatatypeMisalignment"])
  }

  override predicate raisesException(boolean unconditional) { unconditional = true }

  override TSehException getExceptionType() { any() }
}
