# Baseball Data Quality & SLA Monitoring (Week 6)

A reproducible SQLite reporting case study using **synthetic training data**, not MLB production records.

## Business problem
A data operations manager needs daily QC completion, operator accountability, league backlog, and review-type SLA performance.

## Skills
Three-table joins, conditional `COUNT(DISTINCT CASE...)`, `GROUP BY`, `HAVING`, `LEFT JOIN`, completion rates, on-time SLA rates, and safe percentage denominators.

## Reproduce
1. Run `setup.sql` in SQLite or DB Fiddle.
2. Run each query in `queries.sql`.
3. Compare outputs with the summary in `findings.md`.

The queries are adapted from Week 6 Day 4 training submissions. Q1 was AI-coached; Q2 was corrected after feedback; Q3 used references; Q4 was completed independently. This is a learning portfolio, not a production dashboard.
