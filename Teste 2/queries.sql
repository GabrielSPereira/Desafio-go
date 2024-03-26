-- create
CREATE TABLE DiasSemana
(
	DiaId		INT,
	Descricao	VARCHAR(200)
)

CREATE TABLE HorariosTrabalho 
(
	CadastroId	INT,
	DiaId		INT,
	Horas		INT
)

-- insert
INSERT INTO DiasSemana
SELECT 1, 'Domingo' UNION ALL
SELECT 2, 'Segunda' UNION ALL
SELECT 3, 'Terça'	UNION ALL
SELECT 4, 'Quarta'	UNION ALL
SELECT 5, 'Quinta'	UNION ALL
SELECT 6, 'Sexta'	UNION ALL
SELECT 7, 'Sábado'

INSERT INTO HorariosTrabalho
SELECT 1,2,8 UNION ALL
SELECT 1,3,8 UNION ALL
SELECT 1,5,8 UNION ALL
SELECT 1,7,1 UNION ALL
SELECT 1,7,5 UNION ALL
SELECT 2,2,4 UNION ALL
SELECT 2,3,4 UNION ALL
SELECT 2,4,4 UNION ALL
SELECT 2,5,4 UNION ALL
SELECT 2,6,4 UNION ALL
SELECT 2,7,4 UNION ALL
SELECT 3,2,6 UNION ALL
SELECT 3,3,6 UNION ALL
SELECT 3,4,6 UNION ALL
SELECT 3,5,5 UNION ALL
SELECT 3,5,6 UNION ALL
SELECT 3,6,6

-- select 
SELECT 
    dt.CadastroId,
    ds.Descricao AS DiaSemana,
    COALESCE(SUM(ht.Horas), 0) AS TotalHoras
FROM 
    (SELECT DISTINCT CadastroId FROM HorariosTrabalho) dt
CROSS JOIN 
    DiasSemana ds
LEFT JOIN 
    HorariosTrabalho ht ON ht.DiaId = ds.DiaId AND dt.CadastroId = ht.CadastroId
GROUP BY 
    dt.CadastroId, ds.DiaId, ds.Descricao
ORDER BY 
    dt.CadastroId, ds.DiaId;