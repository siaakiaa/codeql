// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from
  Const x, string hasExtendedCanonicalPath, string hasCrateOrigin, int getNumberOfAttrs,
  string hasBody, string isConst, string isDefault, string hasName, string hasTy,
  string hasVisibility
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
  (if x.hasBody() then hasBody = "yes" else hasBody = "no") and
  (if x.isConst() then isConst = "yes" else isConst = "no") and
  (if x.isDefault() then isDefault = "yes" else isDefault = "no") and
  (if x.hasName() then hasName = "yes" else hasName = "no") and
  (if x.hasTy() then hasTy = "yes" else hasTy = "no") and
  if x.hasVisibility() then hasVisibility = "yes" else hasVisibility = "no"
select x, "hasExtendedCanonicalPath:", hasExtendedCanonicalPath, "hasCrateOrigin:", hasCrateOrigin,
  "getNumberOfAttrs:", getNumberOfAttrs, "hasBody:", hasBody, "isConst:", isConst, "isDefault:",
  isDefault, "hasName:", hasName, "hasTy:", hasTy, "hasVisibility:", hasVisibility
