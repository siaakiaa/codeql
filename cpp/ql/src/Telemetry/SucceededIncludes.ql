/**
 * @name Successfully included header files
 * @description A count of all succeeded includes, grouped by filename.
 * @kind metric
 * @tags summary telemetry
 * @id cpp/telemetry/succeeded-includes
 */

import Metrics

from CppMetrics::SucceededIncludeCount m
select m.getIncludeText(), m.getValue()
