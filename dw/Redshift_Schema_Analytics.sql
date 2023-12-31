
DROP TABLE IF EXISTS analytics.brand_basic_info;
DROP TABLE IF EXISTS analytics.brand_information;
DROP TABLE IF EXISTS analytics.aggregated_brand_information;
DROP TABLE IF EXISTS analytics.brand_media_post_time;
DROP TABLE IF EXISTS analytics.aggregated_hashtag_search;
DROP TABLE IF EXISTS analytics.followers_growth;
DROP TABLE IF EXISTS analytics.hashtag_count;
DROP TABLE IF EXISTS analytics.popularity_factor_early_stage;
DROP TABLE IF EXISTS analytics.popularity_factor;
DROP TABLE IF EXISTS analytics.popularity_calculation;

CREATE TABLE ANALYTICS.BRAND_BASIC_INFO (
	TAG_NAME VARCHAR(20) NOT NULL,
	USER_ID VARCHAR(30) NOT NULL,
	PROFILE_PICTURE_URL VARCHAR(1000),
	FOLLOWERS_COUNT INTEGER NOT NULL DEFAULT '0'
);

CREATE TABLE ANALYTICS.BRAND_INFORMATION (
	TAG_NAME VARCHAR(20) NOT NULL,
	USER_ID VARCHAR(30) NOT NULL,
	MEDIA_ID VARCHAR(30) NOT NULL,
	LIKE_COUNT INTEGER NOT NULL DEFAULT '0',
	COMMENTS_COUNT INTEGER NOT NULL DEFAULT '0',
	TS TIMESTAMP NOT NULL,
	MEDIA_COUNT INTEGER NOT NULL DEFAULT '0',
	FOLLOWERS_COUNT INTEGER NOT NULL DEFAULT '0',
	MEDIA_TYPE VARCHAR(20) NOT NULL,
	MEDIA_PRODUCT_TYPE VARCHAR(10) NOT NULL,
	UPDATE_AT TIMESTAMP NOT NULL,
	ENGAGEMENT INTEGER NOT NULL,
	ENGAGEMENT_RATE DOUBLE PRECISION NOT NULL 
	POST_TIME TIMESTAMP NOT NULL,
	DAY_OF_WEEK INTEGER NOT NULL,
	POST_DAY_OF_WEEK VARCHAR(15) NOT NULL  
); 


CREATE TABLE ANALYTICS.AGGREGATED_BRAND_INFORMATION(
	TAG_NAME VARCHAR(20) NOT NULL,
	AVG_ENGAGEMENT_RATE DOUBLE PRECISION NOT NULL,
	BRAND_MEDIA_CNT INTEGER NOT NULL
); 


CREATE TABLE ANALYTICS.BRAND_MEDIA_POST_TIME (
	TAG_NAME VARCHAR(20) NOT NULL,
	TS TIMESTAMP NOT NULL,
	POST_TIME TIMESTAMP NOT NULL,
	DAY_OF_WEEK INTEGER NOT NULL,
	POST_DAY_OF_WEEK VARCHAR(15) NOT NULL
);


CREATE TABLE ANALYTICS.FOLLOWERS_GROWTH (
	TAG_NAME VARCHAR(20) NOT NULL,
	CREATED_AT TIMESTAMP NOT NULL,
	FOLLOWERS_COUNT INTEGER NOT NULL DEFAULT '0'
);


CREATE TABLE ANALYTICS.AGGREGATED_HASHTAG_SEARCH(
	TAG_NAME VARCHAR(20) NOT NULL,
	HASHTAGED_MEDIA_CNT INTEGER NOT NULL
);


CREATE TABLE ANALYTICS.HASHTAG_COUNT(
	RELATED_HASHTAG VARCHAR(100) NOT NULL,
	HASHTAG_FREQUENCY INTEGER NOT NULL
);


CREATE TABLE ANALYTICS.POPULARITY_FACTOR(
	TAG_NAME VARCHAR(20) NOT NULL,
	AVG_ENGAGEMENT_RATE DOUBLE PRECISION NOT NULL,
	HASHTAGED_MEDIA_CNT INTEGER NOT NULL,
  FOLLOWERS_COUNT INTEGER NOT NULL,
	RANK_AVG_ENGAGEMENT_RATE INTEGER NOT NULL, 
	RANK_FOLLOWERS_COUNT INTEGER NOT NULL,
  RANK_HASHTAGED_MEDIA_COUNT INTEGER NOT NULL
);


CREATE TABLE ANALYTICS.POPULARITY_CALCULATION(
	TAG_NAME VARCHAR(20) NOT NULL,
	SUM_RANK INTEGER NOT NULL,
	POPULARITY_RANK INTEGER NOT NULL
);


