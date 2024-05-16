/**
 * @name Untrusted Checkout TOCTOU
 * @description Untrusted Checkout is protected by a security check but the checked-out branch can be changed after the check.
 * @kind problem
 * @problem.severity warning
 * @precision medium
 * @security-severity 5.3
 * @id actions/untrusted-checkout-toctou/high
 * @tags actions
 *       security
 *       external/cwe/cwe-367
 */

import actions
import codeql.actions.security.UntrustedCheckoutQuery
import codeql.actions.security.PoisonableSteps

from LabelControlCheck check, MutableRefCheckoutStep checkout
where
  // the mutable checkout step is protected by an access check
  check = [checkout.getIf(), checkout.getEnclosingJob().getIf()] and
  // there are no evidences that the  checked-out code can lead to arbitrary code execution
  not checkout.getAFollowingStep() instanceof PoisonableStep
select checkout, "The checked-out code can be changed after the authorization check o step $@.",
  check, check.toString()
