You are analyzing a social network dataset at Google. Your task is to find mutual friends between two users, Karl and Hans. There is only one user named Karl and one named Hans in the dataset.

The output should contain 'user_id' and 'user_name' columns.

Tables: users, friends
My solution is:

select a.user_id ,b.user_name
from (
select user_id, user_name from users where user_id in (select friend_id from friends where
user_id = 1)) a
inner join
(select user_id, user_name from users where user_id in (select friend_id from friends where
user_id = 2)) b
on a.user_id = b.user_id;
