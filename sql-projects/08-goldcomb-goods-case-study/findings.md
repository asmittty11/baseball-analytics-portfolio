# Leadership findings — submitted in the Analyst Hive exercise

1. **Active customer definition:** 20,100 customers qualified as active, versus 49,478 total customer records. The larger number represents all customer-table records, not just customers meeting the exercise's active-order definition.
2. **Refund investigation:** The exercise described a refund-system migration with double-logging and a leaking-lid problem for the Drip-Free Glass Honey Dispenser; Ops reportedly pulled the affected batch. SQL found 55 orders with multiple September refund records and attributed $3,196 in refund dollars to that product. The migration explanation and lid defect are scenario facts, not conclusions established by the provided SQL alone.
3. **Revenue reconciliation:** September 2026 Finance net revenue was $258,721, up 5.8% from August. Sales gross sales of $299,482 is a different metric: all statuses, Eastern-time month, before refunds.

## Monthly Finance net revenue
| Month | Sales | Refunds | Net revenue | MoM |
|---|---:|---:|---:|---:|
| June 2026 | 235,220 | 3,245 | 231,975 | — |
| July 2026 | 238,112 | 4,303 | 233,809 | 0.8% |
| August 2026 | 248,893 | 4,404 | 244,489 | 4.6% |
| September 2026 | 266,789 | 8,068 | 258,721 | 5.8% |

Reported outputs from Analyst Hive; underlying tables were not available for independent verification.
