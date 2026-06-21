You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more 
in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.


**The marketing campaign doesn't start until one day after the initial in-app purchase so users that only made one or multiple purchases on the first day do not count,
nor do we count users that over time purchase only the products they purchased on the first day.**

-- Solution code:

WITH first_purchase AS (
    -- Step 1: Find each user's first purchase date
    SELECT 
        user_id, 
        MIN(created_at) AS first_purchase_date
    FROM marketing_campaign
    GROUP BY user_id
),

first_day_products AS (
    -- Step 2: Find all product_ids purchased by each user on their first purchase date
    SELECT DISTINCT mc.user_id, mc.product_id
    FROM marketing_campaign mc
    JOIN first_purchase fp
    ON mc.user_id = fp.user_id
    WHERE mc.created_at = fp.first_purchase_date
),

post_campaign_purchases AS (
    -- Step 3: Find purchases made AFTER the first purchase date
    SELECT DISTINCT mc.user_id, mc.product_id
    FROM marketing_campaign mc
    JOIN first_purchase fp
    ON mc.user_id = fp.user_id
    WHERE mc.created_at > fp.first_purchase_date
)

-- Step 4: Count users who made additional purchases that include new products
SELECT COUNT(DISTINCT pcp.user_id) AS successful_campaign_users
FROM post_campaign_purchases pcp
LEFT JOIN first_day_products fdp
ON pcp.user_id = fdp.user_id AND pcp.product_id = fdp.product_id
WHERE fdp.product_id IS NULL;  -- Exclude users who only bought first-day products
