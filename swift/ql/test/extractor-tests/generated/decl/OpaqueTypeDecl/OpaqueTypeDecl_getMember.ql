// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

from OpaqueTypeDecl x, int index
where toBeTested(x) and not x.isUnknown()
select x, index, x.getMember(index)
