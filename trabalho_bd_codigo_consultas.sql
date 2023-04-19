USE trabalho_bd_codigo;

/* 1 - Encontre a quantidade de laboratórios por bloco utilizando uma junção natural.
No resultado, mostre o nome do bloco e a quantidade de laboratórios encontrados.
Ordene o resultado de forma ascendente pelo nome do bloco. (0,5) */
SELECT blocolaboratorio.blocoLabNome AS 'Bloco', COUNT(laboratorio.blocoLaboratorio_blocoLabId) AS 'Quantidade'
FROM laboratorio NATURAL JOIN blocolaboratorio
WHERE laboratorio.blocoLaboratorio_blocoLabId = blocolaboratorio.blocoLabId
GROUP BY laboratorio.blocoLaboratorio_blocoLabId
ORDER BY blocolaboratorio.blocoLabNome ASC;

/* 2 - Encontre (as)os docentes aos quais nenhuma turma foi atribuída. No
resultado, mostre o nome da(o) docente e a sigla do departamento ao qual
a(o) docente está vinculado. Na construção da consulta deve ser empregado
o conceito de junção externa ou outer join. (0,5) */
SELECT DISTINCT nomeDocente, siglaDepartamento
FROM docente INNER JOIN departamento
ON docente.idDocente NOT IN (SELECT turma.docente_idDocente FROM turma) AND
   departamento.idDepartamento = docente.departamento_idDepartamento;

/* 3 - Encontre a quantidade de disciplinas, por curso, que não geraram a
abertura de uma turma. No resultado, mostre o nome do curso e a
quantidade de disciplinas. (0,5) */
SELECT curso.nomeCurso, COUNT(disciplina.idDisciplina NOT IN (SELECT turma.disciplina_idDisciplina FROM turma)) AS 'Qtd disciplina'
FROM curso, disciplina
WHERE disciplina.idDisciplina NOT IN (SELECT turma.disciplina_idDisciplina FROM turma);

/* 4 - Encontre as (os) docentes que estão vinculados à turmas alocadas em 
laboratórios que possuem equipamentos de desempenho regular. No resultado, 
mostre o nome da (o) docente, o id da turma, o id do laboratório,
o nome do bloco do laboratório reservado e o desempenho dos equipamentos. (0,5) */
SELECT DISTINCT nomeDocente, idTurma, idLaboratorio, blocoLabNome, desempenhoComputador
FROM docente, turma, laboratorio, blocoLaboratorio, computador, reserva
WHERE computador.desempenhoComputador = "Regular" and
      docente.idDocente = turma.docente_idDocente and
      turma.idTurma = reserva.turma_idTurma and
      blocoLabId = blocoLaboratorio_blocoLabId and
      laboratorio.idLaboratorio = computador.laboratorio_idLaboratorio and
      laboratorio.idLaboratorio = reserva.laboratorio_idLaboratorio;

/* 5 - Encontre o laboratório cujos equipamentos possuem a maior quantidade
de programa(s) instalado(s). No resultado, mostre id do laboratório, o desempenho
do computador vinculado ao laboratório e a descrição de cada programa instalado. (0,5) */
SELECT idLaboratorio, desempenhoComputador, descricaoPrograma
FROM laboratorio, computador, programa
WHERE idLaboratorio = laboratorio_idLaboratorio and
	  idComputador = computador_idComputador
GROUP BY computador_idComputador
HAVING COUNT(computador_idComputador) > 1;

/* DELETA TODOS OS INSERTS */
DELETE FROM programa;
DELETE FROM computador;
DELETE FROM reserva;
DELETE FROM laboratorio;
DELETE FROM blocoLaboratorio;
DELETE FROM turma;
DELETE FROM disciplina;
DELETE FROM curso;
DELETE FROM docente;
DELETE FROM departamento;
DELETE FROM blocoLaboratorio;
DELETE FROM instituicao;

/* DROP TABLES PARA TESTE */
DROP TABLE IF EXISTS reserva;
DROP TABLE IF EXISTS turma;
DROP TABLE IF EXISTS programa;
DROP TABLE IF EXISTS computador;
DROP TABLE IF EXISTS laboratorio;
DROP TABLE IF EXISTS instituicao;
DROP TABLE IF EXISTS blocoLaboratorio;
DROP TABLE IF EXISTS docente;
DROP TABLE IF EXISTS disciplina;
DROP TABLE IF EXISTS curso;
DROP TABLE IF EXISTS departamento;

/* DROP DATABASE */
DROP DATABASE IF EXISTS trabalho_bd_codigo;