SELECT * FROM dbo.big
SELECT * FROM dbo.Dict_article
SELECT * FROM dbo.Sposob
SELECT * FROM dbo.Vid
SELECT * FROM dbo.Example
SELECT * FROM dbo.Scheme_entity


SELECT * FROM dbo.big
--��������� �� djphfcne
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

--������� ��� 5 ���� c ������, �������� �� �����
SELECT TOP 5
  D.[Verb],
*FROM
  [big] AS D
ORDER BY
  D.[R]
GO


SELECT 
[�����]	= COUNT(*),
[���������� ��������� � ���������� ����������������]	= COUNT(DISTINCT [Sposob_obraz])
FROM
 [big] AS D 
 Go


 -- ������� ������ �������� ������ ��� 1 � ����� ���-- 
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
  [Meaning] LIKE '"�����.%'
  Go

SELECT [Meaning]
FROM [Example]
WHERE
  [Meaning] LIKE '%�������%'
  Go


--�������� ������� �� ������

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
  [Analogy] LIKE '%�����%'

GO

--�������, ��� 4 ���

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
  D.[Gender], -- � IIF ... = ���, �� ���, ��� ���� �� ��� 
  IIF([Gender] = '�', '������� ', '������� ') -- ����� ������ ������� ���� ������ + D.[Age ]
FROM
  [big] D
 
SELECT
  [Age],
  [���������] =
  CASE
    WHEN [Age] BETWEEN '1' AND '3' THEN '���������'
    WHEN [Age] BETWEEN '3' AND '4' THEN '��������'
    ELSE '��� ������'
  END
FROM
  [big] D


SELECT [Verb], [Name_Sposob_obraz], [Scheme], [Analogy],
 [����� ����� � ������ �����������] =
  [Verb] + ' = ' +
  LEFT([Scheme], 100) + ' ��.' +
  LEFT([Analogy], 100) + ' ' +
  LEFT([Name_Sposob_obraz], 50) + ' ' 
FROM
  [big]
  Go

-- CONCAT ��� �������� ����� ��� ������� �� ���� ������

 SELECT [Verb], [Scheme], [Analogy],
 [����� ����� � ��������] =
  CONCAT ([Verb],' = ',
  LEFT([Scheme], 100),' ��.',
  LEFT([Analogy], 100),'.')
FROM
  [big]
  Go


--��� ������ � ���� ������ ��� ������� � ��� ���� :) �.�. � ���� ��� ��� ���������, ����� ��������� ��� ������� 0 �� ���������� ---
 INSERT INTO dbo.Vid(Vid_verb) VALUES (NULL)

 SELECT
 [Vid_verb], [Verb],
 [���] =
  [Verb] + ' ' +
  ISNULL( ' ' + LEFT([Vid_verb], 1) + '.', '')
FROM
  [big]


DECLARE @������ VARCHAR(500) -- ��� �������� ����������
SELECT @������ = ISNULL(@������ + ', ', '') + [Verb]
FROM
  [big]
WHERE
  [Name_Sposob_obraz] = '�����������-�������������'
ORDER BY
  [Verb]
SELECT @������ AS [����]


--Inner Join � SQL � ��� ��������, ������� ������������ ��� ����������� ������ ��� �����, ������� ����� ���������� � ����� ��������.
--���� ����� Inner Join ����������� ��� ����������� ������, ����� �������� ������������ ������, ������� ������������ � ����� ��������.

SELECT
  *
FROM
  [Sposob] S
  INNER JOIN -- ��������� �������� �� ����� Sposob_obraz
  [Scheme_entity] SE
    ON S.[Sposob_obraz] = SE.[Sposob_obraz]

GO

SELECT * FROM dbo.big
SELECT * FROM dbo.Dict_article
SELECT * FROM dbo.Sposob
SELECT * FROM dbo.Vid
SELECT * FROM dbo.Example
SELECT * FROM dbo.Scheme_entity

--������ ��������, ������� �������������� ������������ �������� (��������� �)

SELECT DISTINCT -- �������� DISTINCT,������� ������������� ������ ������� � ��������� ������ ����������. 
  DA.[�], DA.Verb
FROM
  [Dict_article] DA
  JOIN
  [Sposob] S ON S.[�] = DA.[�]
WHERE
  S.[Sposob_obraz] = '�'

GO
--������ ��������, ������� �������������� ��� ������ ������ ��������
SELECT DISTINCT -- �������� DISTINCT,������� ������������� ������ ������� � ��������� ������ ����������. 
  DA.[�], DA.Verb
FROM
  [Dict_article] DA
  JOIN
  [Sposob] S ON S.[�] = DA.[�]
  JOIN
  [Scheme_entity] SE ON SE.[�] = DA.[�]
WHERE
  SE.[Analogy] = '������ ��������'

GO

--����� ������ ��������� �������, ������� ����������� ������������ ������
SELECT TOP 1
  E.*
FROM
  [Example] E
  JOIN
  [Sposob] S ON S.[�] = E.[�]
WHERE
  S.[Name_Sposob_obraz] = '������������'
ORDER BY
  E.[Age] DESC

GO
-- ����� ������� � ��������� ����� ������ ��������� �������, ������� ����������� ������������ ������
SELECT TOP 1
  B.[�], B.[Verb], B.[Age]
FROM
  [big] B
  JOIN
  [Sposob] S ON S.[�] = B.[�]
WHERE
  S.[Name_Sposob_obraz] = '������������'
ORDER BY
  B.[Age] DESC

GO

---������� ����� JOIN � INNER JOIN.
--JOIN ���������� ��� ������ �� ������, ��� �������� ������ ����� ������� ����� �������� ������ ������ �������.
--INNER JOIN �������� ��� ������ �� ����� ����������� ������, ���� ����� ��������� ���� ����������. 
--SQL INNER JOIN - ��� �� �� �����, ��� � ����������� JOIN, ������������ ������ �� ���� ��� ����� ������.


-- ������ ��� ������ ��������, ������� �� ������ (������� ��������� � ������, �� ��� �������� ��������)
SELECT
  SE.[Analogy],
  [����������] = COUNT(*)
FROM
  [Scheme_entity] SE
  JOIN
  [Dict_article] DA ON DA.[�] = SE.[�]
GROUP BY
  SE.[Analogy]

GO