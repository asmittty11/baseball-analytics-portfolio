# Allan Smith | Baseball Data Analytics & Operations

**SQL • Data Quality • Baseball Operations • Advance Scouting**

I work in MLB/MiLB data operations, supporting live-game statistical accuracy, troubleshooting, and staff training. This portfolio contains reproducible SQLite projects based on synthetic baseball data.

## Projects
- [Baseball data exploration](sql-projects/01-baseball-data-exploration/exploration.sql) — filtering, sorting, and selecting game records.
- [Game operations reporting](sql-projects/02-game-operations-reporting/operations_reporting.sql) — aggregate reporting by league.
- [Data quality validation](sql-projects/03-data-quality-validation/quality_checks.sql) — identifying missing values and duplicates.
- [Relational database joins](sql-projects/04-relational-database-joins/joins.sql) — INNER JOIN versus LEFT JOIN.
- [Baseball operations QC reporting case study (Week 5)](sql-projects/06-baseball-operations-qc-dashboard/README.md) — reproducible three-table SQL reporting of league, operator, and team-level outstanding findings; includes original verified training queries and synthetic data.

- [Baseball Data Quality & SLA Monitoring (Week 6)](sql-projects/07-baseball-data-quality-sla/README.md) — reproducible synthetic SQLite dataset, QC completion, operator accountability, league backlog and SLA analysis.
- [Goldcomb Goods E-commerce Analytics (Analyst Hive)](sql-projects/08-goldcomb-goods-case-study/README.md) — attributed learning case study on active customers, refunds, revenue reconciliation and monthly trends (underlying exercise data not redistributed).

## Reproduce
For projects 01–04, run `documentation/demo_schema.sql` in SQLite before running the query files. The Week 5 QC case study has its own `schema.sql` and reproduction instructions.

## Melbourne Baseball Club — Live Season Analytics & Scouting
I support Melbourne Baseball Club, a semi-professional team in Australia's Victorian Summer Baseball League (VSBL) Premier Division 1, by developing season performance summaries and opponent advance-scouting reports. With the club's approval, scouting and performance reports are published as they are completed.

- **[Interactive Melbourne analytics and scouting dashboard](https://asmittty11.github.io/melbourne-baseball-dashboard/):** searchable and sortable player statistics, opponent comparisons, and published reports.
- **[Dashboard source and report archive](https://github.com/asmittty11/melbourne-baseball-dashboard):** project documentation, data sources, reports, and implementation files.
- **Ongoing 2026–27 season project:** currently covers Melbourne's first **eight games** of its scheduled **30-game season**. The reporting dataset and dashboard are expanded as additional games are played and verified statistics are uploaded; they are not a live, automatic data feed.

The reports are intended to turn available statistics into practical performance and scouting insights. Opponent reporting windows differ, and missing or provisional source values are identified rather than assumed.

## Notes
Projects use synthetic baseball data. Introductory examples are newly written demonstrations of practiced concepts; the Week 5 QC case study preserves actual verified training submissions. No proprietary MLB data is included.

[LinkedIn](https://www.linkedin.com/in/allan-smith-iii/)
