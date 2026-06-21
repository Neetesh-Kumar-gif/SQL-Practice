Friday's Likes Count
You have access to Facebook's database which includes several tables relevant to user interactions. For this task, you are particularly interested in tables that store data about user posts, friendships, and likes. Calculate the total number of likes from friends for each date that falls on a Friday. Only include likes from friends in your totals.


The output should contain two different columns 'likes' and 'date'.

Tables: user_posts, friendships, likes

MySolution is:
WITH friends_likes AS (
    -- Join friendships and likes to filter likes only from friends
    SELECT
        l.post_id,
        l.user_name AS liked_by,
        l.date_liked::DATE AS like_date
    FROM
        friendships f
    JOIN
        likes l
    ON 
        (f.user_name1 = l.user_name OR f.user_name2 = l.user_name)
),
friday_likes AS (
    -- Filter likes that occurred on Fridays
    SELECT
        like_date,
        COUNT(*) AS total_likes
    FROM
        friends_likes
    WHERE
        EXTRACT(DOW FROM like_date) = 5 -- 5 represents Friday
    GROUP BY
        like_date
)
-- Select and format the final result
SELECT
    total_likes AS likes,
    like_date AS date
FROM
    friday_likes
ORDER BY
    like_date;
