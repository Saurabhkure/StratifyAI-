-- Description: Insert news article data into NEWS_ARTICLES table

insert into NEWS_ARTICLES
(TITLE, URL, PUBLISHED_AT, SOURCE, SUMMARY, SENTIMENT_SCORE, SENTIMENT_LABEL)
values
    (
        '{{ ($json["title"] || "").replace(/'/g, "''") }}',
  '{{ ($json["url"] || "").replace(/'/g, "''") }}',
  to_timestamp_ntz('{{ $json["time_published"] }}', 'YYYYMMDDTHH24MISS'),
  '{{ ($json["source"] || "").replace(/'/g, "''") }}',
  '{{ ($json["summary"] || "").replace(/'/g, "''") }}',
  {{ $json["overall_sentiment_score"] || 0 }},
  '{{ ($json["overall_sentiment_label"] || "").replace(/'/g, "''") }}'
);
