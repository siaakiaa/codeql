// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

from PoundAssertStmt x, Expr getCondition, string getMessage
where
  toBeTested(x) and
  not x.isUnknown() and
  getCondition = x.getCondition() and
  getMessage = x.getMessage()
select x, "getCondition:", getCondition, "getMessage:", getMessage
