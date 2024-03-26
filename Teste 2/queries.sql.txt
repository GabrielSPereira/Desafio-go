-- create
CREATE TABLE HorariosTrabalho  (
  CadastroId INTEGER NOT NULL,
  DiaId  INTEGER NOT NULL,
  Horas  INTEGER NOT NULL
);

CREATE TABLE DiasSemana  (
  DiaId INTEGER  NOT NULL,
  Descricao  TEXT NOT NULL
);

-- insert
INSERT INTO HorariosTrabalho VALUES (1, 2, 8);
INSERT INTO HorariosTrabalho VALUES (1,	3, 8);
INSERT INTO HorariosTrabalho VALUES (1, 5, 8);
INSERT INTO HorariosTrabalho VALUES (1,	7, 1);
INSERT INTO HorariosTrabalho VALUES (1, 7, 5);
INSERT INTO HorariosTrabalho VALUES (2,	2, 4);
INSERT INTO HorariosTrabalho VALUES (2,	3, 4);
INSERT INTO HorariosTrabalho VALUES (2,	4, 4);
INSERT INTO HorariosTrabalho VALUES (2,	5, 4);
INSERT INTO HorariosTrabalho VALUES (2,	6, 4);
INSERT INTO HorariosTrabalho VALUES (2,	7, 4);
INSERT INTO HorariosTrabalho VALUES (3,	2, 6);
INSERT INTO HorariosTrabalho VALUES (3,	3, 6);
INSERT INTO HorariosTrabalho VALUES (3,	4, 6);
INSERT INTO HorariosTrabalho VALUES (3,	5, 5);
INSERT INTO HorariosTrabalho VALUES (3,	5, 6);
INSERT INTO HorariosTrabalho VALUES (3,	6, 6);

INSERT INTO DiasSemana VALUES (1, 	'Domingo');
INSERT INTO DiasSemana VALUES (2, 	'Segunda');
INSERT INTO DiasSemana VALUES (3, 	'Terça');
INSERT INTO DiasSemana VALUES (4, 	'Quarta');
INSERT INTO DiasSemana VALUES (5, 	'Quinta');
INSERT INTO DiasSemana VALUES (6, 	'Sexta');
INSERT INTO DiasSemana VALUES (7, 	'Sábado'); 


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
    dt.CadastroId, ds.Descricao
ORDER BY 
    dt.CadastroId, FIELD(ds.Descricao, 'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado');