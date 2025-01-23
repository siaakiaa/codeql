/**
 * Provides a taint tracking configuration for reasoning about
 * command-injection vulnerabilities (CWE-078).
 *
 * Note, for performance reasons: only import this file if
 * `CommandInjection::Configuration` is needed, otherwise
 * `CommandInjectionCustomizations` should be imported instead.
 */

import javascript
import CommandInjectionCustomizations::CommandInjection
import IndirectCommandArgument

/**
 * Holds if `sink` is a data flow sink for command-injection vulnerabilities, and
 * the alert should be placed at the node `highlight`.
 */
predicate isSinkWithHighlight(DataFlow::Node sink, DataFlow::Node highlight) {
  sink instanceof Sink and highlight = sink
  or
  isIndirectCommandArgument(sink, highlight)
}

/**
 * A taint-tracking configuration for reasoning about command-injection vulnerabilities.
 */
module CommandInjectionConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { source instanceof Source }

  predicate isSink(DataFlow::Node sink) { isSinkWithHighlight(sink, _) }

  predicate isBarrier(DataFlow::Node node) { node instanceof Sanitizer }

  predicate observeDiffInformedIncrementalMode() {
    // TODO(diff-informed): Manually verify if config can be diff-informed.
    // ql/src/Security/CWE-078/CommandInjection.ql:31: Column 1 does not select a source or sink originating from the flow call on line 24
    // ql/src/experimental/heuristics/ql/src/Security/CWE-078/CommandInjection.ql:34: Column 1 does not select a source or sink originating from the flow call on line 26
    none()
  }
}

/**
 * Taint-tracking for reasoning about command-injection vulnerabilities.
 */
module CommandInjectionFlow = TaintTracking::Global<CommandInjectionConfig>;

/**
 * DEPRECATED. Use the `CommandInjectionFlow` module instead.
 */
deprecated class Configuration extends TaintTracking::Configuration {
  Configuration() { this = "CommandInjection" }

  override predicate isSource(DataFlow::Node source) { CommandInjectionConfig::isSource(source) }

  override predicate isSink(DataFlow::Node sink) { CommandInjectionConfig::isSink(sink) }

  override predicate isSanitizer(DataFlow::Node node) { CommandInjectionConfig::isBarrier(node) }
}
