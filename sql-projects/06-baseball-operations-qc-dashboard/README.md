# Baseball Operations Quality-Control Reporting Case Study

**SQLite · Data Quality · Operational Reporting · Baseball Operations**

## Project overview
A reproducible SQL reporting case study using **synthetic** game, operator, and quality-control finding records. The reports show how a baseball data operations team could review outstanding issues across leagues, operators, and operational teams.

This is a SQL reporting case study, **not a deployed interactive dashboard**. No proprietary MLB records or systems are included.

## Business questions
- Which leagues have the most unresolved high-severity findings?
- Which operators are associated with the largest outstanding review workloads?
- Which operational team has the greatest urgent workload versus the largest overall backlog?

## Reports
1. **League QC scorecard:** completed games with findings, total findings, unresolved findings, and unresolved high-severity findings by league.
2. **Operator workload:** finalized games with findings and outstanding issues by operator and assigned team.
3. **Team priority summary:** outstanding issue counts across East and West teams.

## Technical skills
Three-table relational joins, `COUNT(DISTINCT ...)`, `GROUP BY`, conditional aggregation with `SUM(CASE WHEN ...)`, business filtering, and multi-level sorting.

## Files
- [schema.sql](schema.sql): complete original synthetic Week 5 Day 7 SQLite dataset (6 operators, 18 games, 27 findings).
- [qc_reporting.sql](qc_reporting.sql): the three **actual submitted, verified SQL solutions** from Week 5 Day 7 Questions 3–5.
- [expected_results.md](expected_results.md): verified outputs, interpretations, and scope notes.

## Reproduce
1. Open SQLite or [DB Fiddle for SQLite](https://dbfiddle.dev/sqlite).
2. Run `schema.sql` to create and populate the tables.
3. Run each statement in `qc_reporting.sql` and compare with `expected_results.md`.

## Results and context
In the sample data, AFL has the most outstanding high-severity findings by league. East has more unresolved high-severity findings than West (5 vs. 3), while West has more unresolved findings overall (7 vs. 5). These are synthetic examples of operational prioritization, not actual organizational performance.

## Authorship and assessment context
These SQL statements are preserved from the author's Week 5 Day 7 training submissions. All three earned 20/20 in execution-based assessment. The league scorecard (Q3) was completed with reference materials; the operator workload (Q4) and team priority (Q5) queries were completed independently. The underlying synthetic dataset was supplied for training; it was not independently collected or sourced from MLB.

## Limitations
- Synthetic, small sample; no production deployment, live feed, or Power BI visualization.
- The `INNER JOIN` reports include only finalized games **with findings**; finalized games without findings are excluded from `final_games`. They are not complete game-volume reports.
- A finding's association with an assigned operator does **not** establish who caused it or measure employee performance.
- Findings are counted by record, without deduplication of similar issues or weighting by business impact.
- Counts are illustrative and should not be treated as actual MLB/MiLB operational statistics.

## Future extension
Add `LEFT JOIN` coverage reporting to include finalized games with zero findings, then visualize the results in Power BI.
