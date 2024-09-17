// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `AvailabilityInfo`.
 */

private import AvailabilityInfoImpl
import codeql.swift.elements.AstNode
import codeql.swift.elements.AvailabilitySpec

/**
 * An availability condition of an `if`, `while`, or `guard` statements.
 *
 * Examples:
 * ```
 * if #available(iOS 12, *) {
 *   // Runs on iOS 12 and above
 * } else {
 *   // Runs only anything below iOS 12
 * }
 * if #unavailable(macOS 10.14, *) {
 *   // Runs only on macOS 10 and below
 * }
 * ```
 */
final class AvailabilityInfo = Impl::AvailabilityInfo;
