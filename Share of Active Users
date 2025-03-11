/*Output share of US users that are active. Active users are the ones with an "open" status in the table fb_active_users.*/


select (count(case when status = 'open' then 1 end)*1.0 / count(*)) as
us_active_share
from fb_active_users where country = 'USA';


