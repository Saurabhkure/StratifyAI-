
-- Description: Insert data into NEWS_TICKER_SENTIMENT table

insert into NEWS_TICKER_SENTIMENT
(ARTICLE_ID, TICKER, RELEVANCE_SCORE, SENTIMENT_SCORE, SENTIMENT_LABEL)
values (
           {{ $json["ARTICLE_ID"] }},
              '{{ ($json["TICKER"] || "").replace(/'/g, "''") }}',
  {{ $json["RELEVANCE_SCORE"] || 0 }},
  {{ $json["SENTIMENT_SCORE"] || 0 }},
  '{{ ($json["SENTIMENT_LABEL"] || "").replace(/'/g, "''") }}'
);
