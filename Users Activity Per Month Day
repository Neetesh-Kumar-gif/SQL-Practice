/*
Return a distribution of users activity per day of the month. By distribution we mean the number of posts per day of the month.*/

select extract(day from post_date) as day_of_month , 
count(*) as post_count
from facebook_posts group by day_of_month order by post_count desc;
