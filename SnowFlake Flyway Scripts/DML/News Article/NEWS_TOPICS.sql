-- Description: Insert data into NEWS_TOPICS table

insert into NEWS_TOPICS (ARTICLE_ID, TOPIC, RELEVANCE_SCORE)
values (
           {{ $json["ARTICLE_ID"] }},
              '{{ ($json["topic"] || "").replace(/'/g, "''") }}',
  {{ $json["relevance_score"] || 0 }}
);
