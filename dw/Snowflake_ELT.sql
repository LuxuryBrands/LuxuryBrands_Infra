--creating brand_basic_info table
DROP TABLE IF EXISTS analytics.brand_basic_info;
CREATE TABLE analytics.brand_basic_info AS
SELECT tag_name, profile_picture_url, followers_count, user_id
FROM raw_data.brand
;

--creating brand_information table
DROP TABLE IF EXISTS analytics.brand_information;
CREATE TABLE analytics.brand_information AS
SELECT B.tag_name, B.user_id, B.media_count, B.followers_count, B.updated_at, A.media_id, A.like_count, A.comments_count, A.ts, A.media_type, A.media_product_type, (A.like_count + A.comments_count) AS engagement, ROUND((engagement / B.followers_count) * 100, 2) AS engagement_rate
FROM raw_data.media A
LEFT JOIN raw_data.brand B ON A.user_id = B.user_id
WHERE A.media_product_type IN ('FEED', 'REELS')
;

--creating brand_followers_growth table
DROP TABLE IF EXISTS analytics.followers_growth;
CREATE TABLE analytics.followers_growth AS
SELECT B.tag_name, A.followers_count, A.created_at
FROM raw_data.brand_log A
LEFT JOIN raw_data.brand B ON A.user_id = B.user_id
;

--creating hashtag_search table
DROP TABLE IF EXISTS analytics.hashtag_search;
CREATE TABLE analytics.hashtag_search AS
SELECT B.tag_name, A.media_id, A.caption, A.ts, A.user_id, A.created_at
FROM raw_data.media_hashtag A
LEFT JOIN raw_data.brand B ON A.user_id = B.user_id
;

DROP TABLE IF EXISTS analytics.trending_topics;
CREATE TABLE analytics.trending_topics AS
SELECT t.ts, t.tag_name ,t.created_at ,x.value AS related_hashtag FROM 
(SELECT ts, tag_name, created_at, REGEXP_SUBSTR_ALL(REPLACE(caption, '#',' #'), '#([\\S]+)', 1, 1, 'e') AS hashtags_list
FROM analytics.hashtag_search) t, LATERAL FLATTEN(t.hashtags_list) x
;

--creating aggregated_brand_information table
DROP TABLE IF EXISTS analytics.aggregated_brand_information;
CREATE TABLE analytics.aggregated_brand_information AS
SELECT tag_name, AVG(engagement_rate) AS avg_engagement_rate, COUNT(DISTINCT media_id) AS brand_media_cnt 
FROM analytics.brand_information 
GROUP BY 1
;

--creating aggregated_hashtag_search table
DROP TABLE IF EXISTS analytics.aggregated_hashtag_search;
CREATE TABLE analytics.aggregated_hashtag_search AS
SELECT tag_name, COUNT(DISTINCT media_id) AS hashtaged_media_cnt
FROM analytics.hashtag_search
GROUP BY 1
;

--creating popularity_factor_early_stage table
DROP TABLE IF EXISTS analytics.popularity_factor_early_stage;
CREATE TABLE analytics.popularity_factor_early_stage AS
SELECT A.tag_name, A.avg_engagement_rate, B.hashtaged_media_cnt
FROM analytics.aggregated_brand_information A
LEFT JOIN analytics.aggregated_hashtag_search B ON A.tag_name= B.tag_name
;

--creating popularity_factor table
DROP TABLE IF EXISTS analytics.popularity_factor;
CREATE TABLE analytics.popularity_factor AS
SELECT A.tag_name, A.avg_engagement_rate, A.hashtaged_media_cnt, B.followers_count, 
	RANK() OVER (ORDER BY avg_engagement_rate DESC) AS rank_avg_engagement_rate, 
	RANK() OVER (ORDER BY hashtaged_media_cnt DESC) AS rank_hashtaged_media_cnt,
	RANK() OVER (ORDER BY followers_count DESC) AS rank_followers_count
	
FROM analytics.popularity_factor_early_stage A
LEFT JOIN analytics.brand_basic_info B ON A.tag_name= B.tag_name
;

--creating popularity_calculation table
DROP TABLE IF EXISTS analytics.popularity_calculation;
CREATE TABLE analytics.popularity_calculation AS
SELECT tag_name, 
	(rank_avg_engagement_rate + rank_hashtaged_media_cnt + rank_followers_count) AS sum_rank,
	RANK() OVER (ORDER BY sum_rank)  AS popularity_rank
FROM analytics.popularity_factor
;

--creating brand_media_post_time table
DROP TABLE IF EXISTS analytics.brand_media_post_time;
CREATE TABLE analytics.brand_media_post_time AS
SELECT ts, tag_name, EXTRACT(HOUR FROM ts) AS post_time,
    EXTRACT(DAYOFWEEK FROM ts) AS day_of_week, 
	CASE EXTRACT(DAYOFWEEK FROM ts)
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
    END AS post_day_of_week
FROM analytics.brand_information 
;

--creating check table
DROP TABLE IF EXISTS analytics.hashtag_count;
CREATE TABLE analytics.hashtag_count AS
SELECT A.related_hashtag, COUNT(*) AS hashtag_frequency
FROM analytics.trending_topics A
GROUP BY A.related_hashtag
;
