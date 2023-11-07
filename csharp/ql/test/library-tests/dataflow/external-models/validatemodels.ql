import csharp
import semmle.code.csharp.dataflow.internal.ExternalFlow
import semmle.code.csharp.dataflow.internal.AccessPathSyntax
import ModelValidation

private predicate getRelevantAccessPath(string path) {
  summaryModel(_, _, _, _, _, _, path, _, _, _) or
  summaryModel(_, _, _, _, _, _, _, path, _, _) or
  sinkModel(_, _, _, _, _, _, path, _, _) or
  sourceModel(_, _, _, _, _, _, path, _, _)
}

private class AccessPathsExternal extends AccessPath::Range {
  AccessPathsExternal() { getRelevantAccessPath(this) }
}
