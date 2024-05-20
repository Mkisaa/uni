SELECT * FROM dbo.big
SELECT * FROM dbo.Dict_article
SELECT * FROM dbo.Sposob
SELECT * FROM dbo.Vid
SELECT * FROM dbo.Example
SELECT * FROM dbo.Scheme_entity


SELECT * FROM dbo.big
--сортирует по djphfcne
SELECT
  D.[R],
  D.[Age],
  D.[Verb],
  D.[Vid_verb],
  D.[Sposob_obraz],
  D.[Gender],

*FROM
  [big] AS D
ORDER BY
  D.[Age]
GO

--выводит топ 5 слов c начала, сортируя по рангу
SELECT TOP 5
  D.[Verb],
*FROM
  [big] AS D
ORDER BY
  D.[R]
GO


SELECT 
[Всего]	= COUNT(*),
[Количество категорий в спосособах словообразования]	= COUNT(DISTINCT [Sposob_obraz])
FROM
 [big] AS D 
 Go


 -- выводит данные возраста больше чем 1 и рядом пол-- 
SELECT 
[Gender], 
[Age] 
FROM [Example] 
WHERE [Age ]> 1
Go

SELECT [Meaning]
FROM [Example]
  Go

  SELECT [Meaning]
FROM [Example]
WHERE
  [Meaning] LIKE '"Несов.%'
  Go

SELECT [Meaning]
FROM [Example]
WHERE
  [Meaning] LIKE '%Одноакт%'
  Go


--аналогии которые не замена

SELECT * from dbo.[Scheme_entity]

SELECT
  D.[Analogy]
FROM
  [big] D

EXCEPT

SELECT
  D.[Analogy]
FROM
  [big] D
 WHERE
  [Analogy] LIKE '%амена%'

GO

--Возраст, без 4 лет

SELECT * from dbo.[Example]

SELECT
  D.[Age]
FROM
  [Example] D

EXCEPT

SELECT
  D.[Age]
FROM
  [Example] D
 WHERE
  D.[Age]=4
Go


SELECT
  D.[Gender], -- в IIF ... = что, на что, что если не что 
  IIF([Gender] = 'ж', 'девочка ', 'мальчик ') -- чтобы убрать возраст надо убрать + D.[Age ]
FROM
  [big] D
 
SELECT
  [Age],
  [Категория] =
  CASE
    WHEN [Age] BETWEEN '1' AND '3' THEN 'маленький'
    WHEN [Age] BETWEEN '3' AND '4' THEN 'побольше'
    ELSE 'еще больше'
  END
FROM
  [big] D


SELECT [Verb], [Name_Sposob_obraz], [Scheme], [Analogy],
 [Схема слова и способ образования] =
  [Verb] + ' = ' +
  LEFT([Scheme], 100) + ' ср.' +
  LEFT([Analogy], 100) + ' ' +
  LEFT([Name_Sposob_obraz], 50) + ' ' 
FROM
  [big]
  Go

-- CONCAT для сложения строк при выборке из базы данных

 SELECT [Verb], [Scheme], [Analogy],
 [Схема слова и аналогия] =
  CONCAT ([Verb],' = ',
  LEFT([Scheme], 100),' ср.',
  LEFT([Analogy], 100),'.')
FROM
  [big]
  Go


--вот почему у меян нельзя так сделать с вид верб :) т.к. я сама это так настроила, чтобы категория под номером 0 не прорпадала ---
 INSERT INTO dbo.Vid(Vid_verb) VALUES (NULL)

 SELECT
 [Vid_verb], [Verb],
 [ФИО] =
  [Verb] + ' ' +
  ISNULL( ' ' + LEFT([Vid_verb], 1) + '.', '')
FROM
  [big]


DECLARE @Статья VARCHAR(500) -- для создания переменной
SELECT @Статья = ISNULL(@Статья + ', ', '') + [Verb]
FROM
  [big]
WHERE
  [Name_Sposob_obraz] = 'Приставочно-суффиксальный'
ORDER BY
  [Verb]
SELECT @Статья AS [ИТОГ]


--Inner Join в SQL — это операция, которая используется для возвращения только тех строк, которые имеют совпадения в обеих таблицах.
--Чаще всего Inner Join применяется для объединения таблиц, чтобы получить подмножества данных, которые присутствуют в обеих таблицах.

SELECT
  *
FROM
  [Sposob] S
  INNER JOIN -- объединят сущности по ключу Sposob_obraz
  [Scheme_entity] SE
    ON S.[Sposob_obraz] = SE.[Sposob_obraz]

GO

SELECT * FROM dbo.big
SELECT * FROM dbo.Dict_article
SELECT * FROM dbo.Sposob
SELECT * FROM dbo.Vid
SELECT * FROM dbo.Example
SELECT * FROM dbo.Scheme_entity

--Список глаголов, которые образовывались приставочным способом (категория А)

SELECT DISTINCT -- оператор DISTINCT,удаляет повторяющиеся строки запроса и оставляет только уникальные. 
  DA.[№], DA.Verb
FROM
  [Dict_article] DA
  JOIN
  [Sposob] S ON S.[№] = DA.[№]
WHERE
  S.[Sposob_obraz] = 'А'

GO
--Список глаголов, которые образовывались при помощи замены префикса
SELECT DISTINCT -- оператор DISTINCT,удаляет повторяющиеся строки запроса и оставляет только уникальные. 
  DA.[№], DA.Verb
FROM
  [Dict_article] DA
  JOIN
  [Sposob] S ON S.[№] = DA.[№]
  JOIN
  [Scheme_entity] SE ON SE.[№] = DA.[№]
WHERE
  SE.[Analogy] = 'замена префикса'

GO

--Найти самого взрослого ребенка, который использовал приставочный способ
SELECT TOP 1
  E.*
FROM
  [Example] E
  JOIN
  [Sposob] S ON S.[№] = E.[№]
WHERE
  S.[Name_Sposob_obraz] = 'Приставочный'
ORDER BY
  E.[Age] DESC

GO
-- БОЛЕЕ КРАСИВО И КОНКРЕТНО Найти самого взрослого ребенка, который использовал приставочный способ
SELECT TOP 1
  B.[№], B.[Verb], B.[Age]
FROM
  [big] B
  JOIN
  [Sposob] S ON S.[№] = B.[№]
WHERE
  S.[Name_Sposob_obraz] = 'Приставочный'
ORDER BY
  B.[Age] DESC

GO

---Разница между JOIN и INNER JOIN.
--JOIN возвращает все строки из таблиц, где ключевая запись одной таблицы равна ключевой записи другой таблицы.
--INNER JOIN выбирает все строки из обеих участвующих таблиц, если между столбцами есть совпадение. 
--SQL INNER JOIN - это то же самое, что и предложение JOIN, объединяющее строки из двух или более таблиц.


-- Выдать для каждой аналогии, сколько их каждой (требует доработки в данных, но оно исправно работает)
SELECT
  SE.[Analogy],
  [Количество] = COUNT(*)
FROM
  [Scheme_entity] SE
  JOIN
  [Dict_article] DA ON DA.[№] = SE.[№]
GROUP BY
  SE.[Analogy]

GO