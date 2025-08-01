USE [Alert]
GO
/****** Object:  StoredProcedure [dbo].[Stock_Alert_Status]    Script Date: 6/25/2025 3:41:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Stock_Alert_Status]
AS
BEGIN
    SET NOCOUNT ON;

    
    DELETE FROM [dbo].InventoryPartProfile$
    WHERE totalQuantity = 0;

   
    CREATE TABLE #QuantityRanges (
        PartID INT,
        totalQuantity INT,
        QuantityRange INT
    );

INSERT INTO #QuantityRanges (PartID, totalQuantity, QuantityRange)
SELECT 
    PartID, 
    totalQuantity,
    CASE 
      
        WHEN totalQuantity = 0 THEN 0
        
      
        WHEN totalQuantity > 0 AND totalQuantity <= 9 THEN 1
        
       
        WHEN totalQuantity BETWEEN 10 AND 59 THEN 10
        WHEN totalQuantity BETWEEN 60 AND 99 THEN 60
        
      
        WHEN totalQuantity BETWEEN 100 AND 399 THEN 100
        WHEN totalQuantity BETWEEN 400 AND 699 THEN 400
        WHEN totalQuantity BETWEEN 700 AND 999 THEN 700
     
        WHEN totalQuantity BETWEEN 1000 AND 1999 THEN 1000
        WHEN totalQuantity BETWEEN 2000 AND 2999 THEN 2000
        WHEN totalQuantity BETWEEN 3000 AND 3999 THEN 3000
        WHEN totalQuantity BETWEEN 4000 AND 4999 THEN 4000
        WHEN totalQuantity BETWEEN 5000 AND 5999 THEN 5000
        WHEN totalQuantity BETWEEN 6000 AND 6999 THEN 6000
        WHEN totalQuantity BETWEEN 7000 AND 7999 THEN 7000
        WHEN totalQuantity BETWEEN 8000 AND 8999 THEN 8000
        WHEN totalQuantity BETWEEN 9000 AND 9999 THEN 9000
        
        
        WHEN totalQuantity BETWEEN 10000 AND 19999 THEN 10000
        WHEN totalQuantity BETWEEN 20000 AND 29999 THEN 20000
        WHEN totalQuantity BETWEEN 30000 AND 39999 THEN 30000
        WHEN totalQuantity BETWEEN 40000 AND 49999 THEN 40000
        WHEN totalQuantity BETWEEN 50000 AND 59999 THEN 50000
        WHEN totalQuantity BETWEEN 60000 AND 69999 THEN 60000
        WHEN totalQuantity BETWEEN 70000 AND 79999 THEN 70000
        WHEN totalQuantity BETWEEN 80000 AND 89999 THEN 80000
        WHEN totalQuantity BETWEEN 90000 AND 99999 THEN 90000
        
        
        WHEN totalQuantity BETWEEN 100000 AND 199999 THEN 100000
        WHEN totalQuantity BETWEEN 200000 AND 299999 THEN 200000
        WHEN totalQuantity BETWEEN 300000 AND 399999 THEN 300000
        WHEN totalQuantity BETWEEN 400000 AND 499999 THEN 400000
        WHEN totalQuantity BETWEEN 500000 AND 599999 THEN 500000
        WHEN totalQuantity BETWEEN 600000 AND 699999 THEN 600000
        WHEN totalQuantity BETWEEN 700000 AND 799999 THEN 700000
        WHEN totalQuantity BETWEEN 800000 AND 899999 THEN 800000
        WHEN totalQuantity BETWEEN 900000 AND 999999 THEN 900000
        
       
        WHEN totalQuantity BETWEEN 1000000 AND 1999999 THEN 1000000
        WHEN totalQuantity BETWEEN 2000000 AND 2999999 THEN 2000000
        WHEN totalQuantity BETWEEN 3000000 AND 3999999 THEN 3000000
        WHEN totalQuantity BETWEEN 4000000 AND 4999999 THEN 4000000
        WHEN totalQuantity BETWEEN 5000000 AND 5999999 THEN 5000000
        WHEN totalQuantity BETWEEN 6000000 AND 6999999 THEN 6000000
        WHEN totalQuantity BETWEEN 7000000 AND 7999999 THEN 7000000
        WHEN totalQuantity BETWEEN 8000000 AND 8999999 THEN 8000000
        WHEN totalQuantity BETWEEN 9000000 AND 9999999 THEN 9000000
        
     
        WHEN totalQuantity BETWEEN 10000000 AND 19999999 THEN 10000000
        WHEN totalQuantity BETWEEN 20000000 AND 29999999 THEN 20000000
        WHEN totalQuantity BETWEEN 30000000 AND 39999999 THEN 30000000
        WHEN totalQuantity BETWEEN 40000000 AND 49999999 THEN 40000000
        WHEN totalQuantity BETWEEN 50000000 AND 59999999 THEN 50000000
        WHEN totalQuantity BETWEEN 60000000 AND 69999999 THEN 60000000
        WHEN totalQuantity BETWEEN 70000000 AND 79999999 THEN 70000000
        WHEN totalQuantity BETWEEN 80000000 AND 89999999 THEN 80000000
        WHEN totalQuantity BETWEEN 90000000 AND 99999999 THEN 90000000
        
       
        WHEN totalQuantity BETWEEN 100000000 AND 199999999 THEN 100000000
        WHEN totalQuantity BETWEEN 200000000 AND 299999999 THEN 200000000
        WHEN totalQuantity BETWEEN 300000000 AND 399999999 THEN 300000000
        WHEN totalQuantity BETWEEN 400000000 AND 499999999 THEN 400000000
        WHEN totalQuantity BETWEEN 500000000 AND 599999999 THEN 500000000
        WHEN totalQuantity BETWEEN 600000000 AND 699999999 THEN 600000000
        WHEN totalQuantity BETWEEN 700000000 AND 799999999 THEN 700000000
        WHEN totalQuantity BETWEEN 800000000 AND 899999999 THEN 800000000
        WHEN totalQuantity BETWEEN 900000000 AND 999999999 THEN 900000000
        
       
        WHEN totalQuantity BETWEEN 1000000000 AND 1999999999 THEN 1000000000
        WHEN totalQuantity BETWEEN 2000000000 AND 2999999999 THEN 2000000000
        WHEN totalQuantity BETWEEN 3000000000 AND 3999999999 THEN 3000000000
        WHEN totalQuantity BETWEEN 4000000000 AND 4999999999 THEN 4000000000
        WHEN totalQuantity BETWEEN 5000000000 AND 5999999999 THEN 5000000000
        WHEN totalQuantity BETWEEN 6000000000 AND 6999999999 THEN 6000000000
        WHEN totalQuantity BETWEEN 7000000000 AND 7999999999 THEN 7000000000
        WHEN totalQuantity BETWEEN 8000000000 AND 8999999999 THEN 8000000000
        WHEN totalQuantity BETWEEN 9000000000 AND 9999999999 THEN 9000000000
        
        ELSE NULL
    END AS QuantityRange
FROM [dbo].InventoryPartProfile$
WHERE totalQuantity IS NOT NULL;
 
   
    CREATE TABLE #RangeCounts (
        PartID INT,
        QuantityRange INT,
        RangeCount INT
    );

    INSERT INTO #RangeCounts (PartID, QuantityRange, RangeCount)
    SELECT 
        PartID, 
        QuantityRange, 
        COUNT(*) AS RangeCount
    FROM #QuantityRanges
    GROUP BY PartID, QuantityRange;

    
    CREATE TABLE #MaxCounts (
        PartID INT,
        MaxCount INT
    );

    INSERT INTO #MaxCounts (PartID, MaxCount)
    SELECT 
        PartID, 
        MAX(RangeCount) AS MaxCount
    FROM #RangeCounts
    GROUP BY PartID;

   
    CREATE TABLE #SecondMaxCounts (
        PartID INT,
        SecondMaxCount INT
    );

    INSERT INTO #SecondMaxCounts (PartID, SecondMaxCount)
    SELECT 
        rc.PartID,
        MAX(rc.RangeCount) AS SecondMaxCount
    FROM #RangeCounts rc
    JOIN #MaxCounts mc ON rc.PartID = mc.PartID
    WHERE rc.RangeCount < mc.MaxCount
    GROUP BY rc.PartID;

    

    INSERT INTO #SecondMaxCounts (PartID, SecondMaxCount)
    SELECT 
        mc.PartID,
        mc.MaxCount AS SecondMaxCount
    FROM #MaxCounts mc
    LEFT JOIN #SecondMaxCounts smc ON mc.PartID = smc.PartID
    WHERE smc.PartID IS NULL;

   
    CREATE TABLE #MatchMAX (
        PartID INT,
        Match_MAX INT
    );

    INSERT INTO #MatchMAX (PartID, Match_MAX)
    SELECT 
        rc.PartID,
        MIN(rc.QuantityRange) AS Match_MAX
    FROM #RangeCounts rc
    JOIN #MaxCounts mc ON rc.PartID = mc.PartID AND rc.RangeCount = mc.MaxCount
    GROUP BY rc.PartID;

    
    CREATE TABLE #MatchMAX2 (
        PartID INT,
        Match_MAX2 INT
    );

    INSERT INTO #MatchMAX2 (PartID, Match_MAX2)
    SELECT 
        rc.PartID,
        MIN(rc.QuantityRange) AS Match_MAX2
    FROM #RangeCounts rc
    JOIN #SecondMaxCounts smc ON rc.PartID = smc.PartID AND rc.RangeCount = smc.SecondMaxCount
    GROUP BY rc.PartID;

    
    CREATE TABLE #CombinedData (
        PartID INT,
        Match_MAX INT,
        Match_MAX2 INT,
        MAX INT,
        MAX_2 INT,
        Diff INT
    );

    INSERT INTO #CombinedData (PartID, Match_MAX, Match_MAX2, MAX, MAX_2, Diff)
    SELECT 
        mm.PartID,
        mm.Match_MAX,
        mm2.Match_MAX2,
        mc.MaxCount AS MAX,
        smc.SecondMaxCount AS MAX_2,
        mc.MaxCount - smc.SecondMaxCount AS Diff
    FROM #MatchMAX mm
    JOIN #MatchMAX2 mm2 ON mm.PartID = mm2.PartID
    JOIN #MaxCounts mc ON mm.PartID = mc.PartID
    JOIN #SecondMaxCounts smc ON mm.PartID = smc.PartID;

   
    CREATE TABLE #FirstPass (
        PartID INT,
        Match_MAX INT,
        Match_MAX2 INT,
        MAX INT,
        MAX_2 INT,
        Diff INT,
        Custom INT
    );

    INSERT INTO #FirstPass
    SELECT 
        PartID,
        Match_MAX,
        Match_MAX2,
        MAX,
        MAX_2,
        Diff,
        CASE 
            WHEN Diff > 40 AND Match_MAX2 < Match_MAX THEN Match_MAX
            WHEN MAX_2 = 1 AND (MAX >= 1 AND MAX < 100) THEN Match_MAX
            ELSE Match_MAX2
        END AS Custom
    FROM #CombinedData;

    
    SELECT 
        fp.PartID,
        fp.Match_MAX,
        fp.Match_MAX2,
        fp.MAX,
        fp.MAX_2,
        fp.Diff,
        fp.Custom,
        LEN(CAST(fp.MAX AS VARCHAR(10))) AS Custom_1,
        LEN(CAST(fp.MAX_2 AS VARCHAR(10))) AS Custom_2,
        CASE 
            WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
            WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
            WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
            WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
            WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
            WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
            ELSE fp.Match_MAX
        END AS Done,
        CASE 
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 1 THEN 'In Stock >=1'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 10 THEN 'In Stock >=10'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 100 THEN 'In Stock >=100'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 1000 THEN 'In Stock >=1000'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 10000 THEN 'In Stock >=10000'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 100000 THEN 'In Stock >=100000'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 1000000 THEN 'In Stock >=1000000'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 10000000 THEN 'In Stock >=10000000'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 100000000 THEN 'In Stock >=100000000'
            WHEN CASE 
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 4 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 3) THEN 
                        CASE WHEN fp.Match_MAX2 < fp.Match_MAX THEN fp.Match_MAX2 ELSE fp.Match_MAX END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) = 3 AND LEN(CAST(fp.MAX_2 AS VARCHAR(10))) = 2) THEN 
                        CASE WHEN fp.Match_MAX < fp.Match_MAX2 THEN fp.Match_MAX ELSE fp.Match_MAX2 END
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX_2 >= 6 AND fp.MAX_2 <= 9) AND (fp.MAX >= 10 AND fp.MAX <= 16) THEN fp.Match_MAX2
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX >= 17) THEN fp.Match_MAX
                    WHEN (LEN(CAST(fp.MAX AS VARCHAR(10))) > LEN(CAST(fp.MAX_2 AS VARCHAR(10)))) AND (fp.MAX < 9) AND (fp.MAX_2 < 6) THEN fp.Match_MAX2
                    ELSE fp.Match_MAX
                END = 1000000000 THEN 'In Stock >=1000000000'
            ELSE ''
        END AS Flage
    FROM #FirstPass fp;


    DROP TABLE #QuantityRanges;
    DROP TABLE #RangeCounts;
    DROP TABLE #MaxCounts;
    DROP TABLE #SecondMaxCounts;
    DROP TABLE #MatchMAX;
    DROP TABLE #MatchMAX2;
    DROP TABLE #CombinedData;
    DROP TABLE #FirstPass;
END