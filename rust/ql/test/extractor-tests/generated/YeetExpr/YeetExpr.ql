// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from YeetExpr x, string hasExpr
where
  toBeTested(x) and
  not x.isUnknown() and
  if x.hasExpr() then hasExpr = "yes" else hasExpr = "no"
select x, "hasExpr:", hasExpr
