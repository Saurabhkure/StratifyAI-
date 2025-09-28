-- Description: Table to store topics associated with news articles

create or replace TABLE FIRSTDB.PUBLIC.NEWS_TOPICS (
	ARTICLE_ID NUMBER(38,0),
	TOPIC VARCHAR(16777216),
	RELEVANCE_SCORE FLOAT,
	foreign key (ARTICLE_ID) references FIRSTDB.PUBLIC.NEWS_ARTICLES(ID)
);