// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from
  SelfParam x, int getNumberOfAttrs, string hasTy, string isMut, string hasLifetime, string hasName
where
  toBeTested(x) and
  not x.isUnknown() and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (if x.hasTy() then hasTy = "yes" else hasTy = "no") and
  (if x.isMut() then isMut = "yes" else isMut = "no") and
  (if x.hasLifetime() then hasLifetime = "yes" else hasLifetime = "no") and
  if x.hasName() then hasName = "yes" else hasName = "no"
select x, "getNumberOfAttrs:", getNumberOfAttrs, "hasTy:", hasTy, "isMut:", isMut, "hasLifetime:",
  hasLifetime, "hasName:", hasName
