# Operational findings

Synthetic practice dataset; numbers are not production MLB metrics.

- 24 finalized games and 40 review records on those games.
- Review-type performance: Scoring 14 total / 11 completed / 3 open / 2 open High / 5 late; Roster 13 / 9 / 4 / 2 / 0; Timing 13 / 9 / 4 / 1 / 3.
- Scoring late-share is 45.5% (5 of 11 completed), despite a 78.6% completion rate.
- Operator backlog: Taylor has 3 open High-priority reviews; Drew has 2.
- A manager should prioritize open High-severity reviews and review why Scoring completion timeliness lags.

## Limitations
Counts are based on a deliberately small synthetic dataset. Review SLA is recorded as a boolean, not calculated from timestamps. No production systems or internal records are represented.
