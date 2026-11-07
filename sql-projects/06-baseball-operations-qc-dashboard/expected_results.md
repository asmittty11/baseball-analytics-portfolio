# Verified SQLite outputs

All outputs below use the synthetic dataset in `schema.sql` and the queries in `qc_reporting.sql`. The original Week 5 Day 7 submissions were graded 20/20 each.

## A. League QC scorecard (Q3)
| league | final_games | total_findings | unresolved_findings | unresolved_high_severity |
|---|---:|---:|---:|---:|
| AFL | 4 | 8 | 4 | 3 |
| AA | 4 | 6 | 3 | 2 |
| AAA | 4 | 6 | 3 | 2 |
| MLB | 3 | 5 | 2 | 1 |

**Interpretation:** AFL has the largest unresolved high-severity count among these four leagues.

## B. Operator workload (Q4)
| operator_name | team | final_games | total_findings | unresolved_findings |
|---|---|---:|---:|---:|
| Casey | East | 3 | 5 | 3 |
| Drew | West | 3 | 5 | 3 |
| Taylor | West | 2 | 3 | 3 |
| Allan | East | 3 | 6 | 2 |
| Morgan | West | 2 | 4 | 1 |
| Jordan | East | 2 | 2 | 0 |

**Interpretation:** Casey, Drew, and Taylor are each associated with three unresolved findings. Association does not imply responsibility for an issue.

## C. Team priority report (Q5)
| team | final_games | total_findings | unresolved_findings | unresolved_high_severity |
|---|---:|---:|---:|---:|
| East | 8 | 13 | 5 | 5 |
| West | 7 | 12 | 7 | 3 |

**Interpretation:** East has more unresolved high-severity findings; West has more unresolved findings overall.

## Reproduction
1. Execute `schema.sql` using SQLite or DB Fiddle (SQLite).
2. Execute the three statements in `qc_reporting.sql` separately.
3. Compare each result with the corresponding table above.

## Scope note
`final_games` in these reports means distinct *finalized games with at least one finding*, not all finalized games. The inner joins exclude finalized games without findings. For complete game coverage, a future `LEFT JOIN` extension is needed.
