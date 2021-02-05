.headers on
.mode columns

--1numero de jornalistas por pais
SELECT DISTINCT journalist.country , COUNT(journalist.country) as number_of_journalists FROM journalist
GROUP BY country
ORDER BY number_of_journalists DESC;

--2jornalistas com supervisor e o pais correspondente
SELECT journalist.name , journalist.surname , journalist.country FROM journalist
WHERE supervisor != 'NULL';

--3id do writer e editor com noticias publicadas que tenham uma foto png
SELECT news.id as news_id , news.writer as writer_id, news.editor as editor_id FROM news
JOIN journalist USING (id)
WHERE news.id IN (
      SELECT images.id FROM images
      JOIN news ON images.newsId = news.id
      WHERE path LIKE "%.png"
      )
AND news.state = 'published';

--4editor com noticias nao publicadas
SELECT DISTINCT journalist.id as editor_w_nopubli_news , journalist.name , journalist.surname FROM journalist
WHERE journalist.id IN(
      SELECT news.editor FROM news
      JOIN journalist USING (id)
      WHERE state = 'notpublished'
);

--5ultima Environmental news a ser updated
SELECT news.id as last_envir_upd_new FROM news
WHERE news.id IN (
    SELECT newsCategory.newsId FROM newsCategory
    JOIN news ON newsCategory.newsId = news.id
    JOIN category ON newsCategory.categoryId = category.id
    WHERE newsCategory.categoryId IN(
        SELECT category.id FROM category
        WHERE description = 'Environmental'
      )
)
ORDER BY news.updatedAt DESC LIMIT 1;

--6numero de noticias publicadas por categoria
SELECT category.description as category , COUNT(newsCategory.newsId) as nº_published_news FROM newsCategory
JOIN news ON newsCategory.newsId = news.id
JOIN category ON newsCategory.categoryId = category.id
WHERE newsCategory.newsId IN(
  SELECT news.id FROM news
  WHERE state = 'published'
)
GROUP BY category.description;

--7numero de noticias published / notpublished / deleted
SELECT news.state , COUNT(*) as number_of_news FROM news
GROUP BY state
ORDER BY number_of_news DESC;

--8news que nunca foram updated e o estado é apagado
SELECT news.id as never_upd_and_state_del FROM news
WHERE updatedAt = createdAt and news.state = 'deleted';

--9nome writers dennamrk com noticias publicadas
SELECT name , surname , news.id as news_published_from_dennmark_writers FROM news
JOIN journalist ON writer = journalist.id
WHERE state = 'published' AND journalist.country = 'Denmark';

--10nome editor dennamrk com noticias nao publicadas mais recente e seu news.id
SELECT journalist.id as journ_denm_w_notpublished_news_recente, name , surname , news.id as news_id FROM news
JOIN journalist ON editor = journalist.id
WHERE state = 'notpublished' AND country = 'Denmark'
ORDER BY createdAt ASC LIMIT 1;


--SQL QUERIES DO RECURSO 2020 ( CERTISSIMAS )
--id das noticias que nao tem imagens nem categoria ordenadas desc
SELECT news.id as news_wo_img_and_cat FROM news
WHERE news.id NOT IN (
  SELECT newsCategory.newsId FROM newsCategory
  JOIN news ON newsCategory.newsId = news.id
  UNION
  SELECT images.newsId FROM images
  JOIN news ON images.newsId = news.id
)
ORDER BY news.id DESC;

--numero de imagens do tipo gif (total)
SELECT COUNT(*) as total FROM images
WHERE path LIKE '%gif%';
