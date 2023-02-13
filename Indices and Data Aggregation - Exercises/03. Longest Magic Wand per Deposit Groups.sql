SELECT
    w.[DepositGroup],
    MAX(w.[MagicWandSize]) AS [LongestMagicWand]
  FROM [WizzardDeposits] AS w
 GROUP BY w.[DepositGroup]