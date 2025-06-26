✅ Stored Procedure: Stock_Alert_Status
🔍 Purpose:
This stored procedure performs stock quantity analysis on inventory items. It categorizes items into quantity ranges, determines the most frequent range per part, and applies logic to determine stock alert statuses (flags).

🧩 Main Operations:
Cleanup:

Deletes all items with totalQuantity = 0.

Range Calculation:

Inserts each item into one of many predefined quantity brackets (e.g., 0, 1–9, 10–59, ..., up to billions).

Frequency Analysis:

Counts how many times each part ID appears in each quantity range.

Identifies the most frequent and second most frequent ranges per part.

Decision Logic:

Uses difference (Diff) between top two frequencies to decide whether the dominant range is significant enough.

Applies fallback logic when frequency difference is small or ambiguous.

Stock Flagging:

Assigns a stock status flag (like In Stock >=100, In Stock >=1000, etc.) based on the chosen quantity range and its frequency.

Final Output:

Returns each part's ID, key stats, chosen ranges, logic evaluation, and final stock flag label.