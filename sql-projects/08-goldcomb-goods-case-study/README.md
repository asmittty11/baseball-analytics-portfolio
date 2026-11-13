# Goldcomb Goods — E-commerce Analytics Case Study

**Source exercise:** [Analyst Hive, “Your First Week at Goldcomb Goods”](https://tools.analysthive.io/analyst-week/week). SQL solutions and written interpretation submitted during a guided learning exercise; not an independently designed business engagement.

## Questions
1. Count registered customers and clarify the definition of active customers.
2. Investigate duplicate refund records and the product associated with the most reported refunds.
3. Reconcile Sales gross sales with Finance net revenue.
4. Build June–September monthly revenue and month-over-month trends.

## Results reported by the exercise
- 49,478 customer records; 20,100 active customers under the exercise's order-based definition.
- September 2026: 221 refund rows, 55 orders with multiple refund rows.
- September gross sales (Sales definition): $299,482; Finance net revenue: $258,721.
- September net revenue grew 5.8% month over month.

## Files
- [queries.sql](queries.sql): original learner SQL patterns, with dialect-specific syntax (e.g., `DATE_TRUNC`, `INTERVAL`, `LAG`).
- [findings.md](findings.md): three executive findings and interpretation cautions.

## Reproducibility and attribution
The underlying Analyst Hive database is **not included**, and the reported results have not been independently reproduced outside the exercise. Queries are presented for learning/portfolio discussion, not as a runnable standalone database project. Credit to Analyst Hive for the scenario and dataset.

**Data modeling cautions:** `DISTINCT(order_id, amount)` is not a guaranteed refund-event identifier; a multi-product order may require allocating refund dollars to individual items. The example queries follow the training exercise's assumptions, not a production-validated refund model.
