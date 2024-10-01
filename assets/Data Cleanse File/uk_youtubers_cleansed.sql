/*

#Data cleaning steps

1.Remove unneccessary columns
2.Extract youtube channel names from first column
3.Rename the columns

*/



--select NOMBRE
--		,total_subscribers
--		,total_views
--		,total_videos
--From top_uk_youtubers_2024


select * from top_uk_youtubers_2024


CREATE VIEW uk_youtubers_2024 as
SELECT CAST(LEFT(NOMBRE,CHARINDEX('@',NOMBRE) -1) as varchar(100)) as channel_name
		,total_subscribers
		,total_views
		,total_videos
from 
	top_uk_youtubers_2024


--checking if there are 4 columns in the dataset
select distinct(count(channel_name)) from uk_youtubers_2024

select
	count(*)
from
	uk_youtubers_2024


--checking if there are 4 columns in the dataset

select 
	count(*) from INFORMATION_SCHEMA.columns
where
	TABLE_NAME = 'uk_youtubers_2024'



--Data type check

select 
	COLUMN_NAME,DATA_TYPE from INFORMATION_SCHEMA.columns
where
	TABLE_NAME = 'uk_youtubers_2024'


--duplicate count check
select distinct(count(*)) from uk_youtubers_2024

--OR

select channel_name,
	count(*) as duplicate_values
from uk_youtubers_2024
group by channel_name
having count(*) > 1




--Checking if all channels have values

select * 
from
	top_uk_youtubers_2024
	uk_youtubers_2024

where
	channel_name is NULL or total_subscribers is NUll or total_views is Null or total_videos is Null


--updating channels with null values
update uk_youtubers_2024
set total_subscribers = 4570000,
total_views = 1985984631,
total_videos = 984
where channel_name like '%Saurus%'


