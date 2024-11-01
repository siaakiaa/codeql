// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from
  Struct x, string hasExtendedCanonicalPath, string hasCrateOrigin, int getNumberOfAttrs,
  string hasFieldList, string hasGenericParamList, string hasName, string hasVisibility,
  string hasWhereClause
where
  toBeTested(x) and
  not x.isUnknown() and
  (
    if x.hasExtendedCanonicalPath()
    then hasExtendedCanonicalPath = "yes"
    else hasExtendedCanonicalPath = "no"
  ) and
  (if x.hasCrateOrigin() then hasCrateOrigin = "yes" else hasCrateOrigin = "no") and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (if x.hasFieldList() then hasFieldList = "yes" else hasFieldList = "no") and
  (if x.hasGenericParamList() then hasGenericParamList = "yes" else hasGenericParamList = "no") and
  (if x.hasName() then hasName = "yes" else hasName = "no") and
  (if x.hasVisibility() then hasVisibility = "yes" else hasVisibility = "no") and
  if x.hasWhereClause() then hasWhereClause = "yes" else hasWhereClause = "no"
select x, "hasExtendedCanonicalPath:", hasExtendedCanonicalPath, "hasCrateOrigin:", hasCrateOrigin,
  "getNumberOfAttrs:", getNumberOfAttrs, "hasFieldList:", hasFieldList, "hasGenericParamList:",
  hasGenericParamList, "hasName:", hasName, "hasVisibility:", hasVisibility, "hasWhereClause:",
  hasWhereClause
