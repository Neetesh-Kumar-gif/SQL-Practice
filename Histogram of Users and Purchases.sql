SELECT 
  transaction_date,
  COUNT(DISTINCT user_id),
  COUNT(DISTINCT product_id)
FROM user_transactions
WHERE (user_id,transaction_date) IN (SELECT user_id,MAX(transaction_date) FROM user_transactions GROUP BY user_id)
GROUP BY transaction_date;
