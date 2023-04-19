USE trabalho_bd_codigo;

/* USO DO INSERT */
INSERT INTO blocoLaboratorio (blocoLabId, blocoLabNome)
	VALUES (01, "A"),
		   (02, "B"),
           (03, "C"),
           (04, "D"),
           (05, "E");

INSERT INTO departamento (idDepartamento, nomeDepartamento, siglaDepartamento)
	VALUES (01, "Departamento Financeiro Contábil", "DEFIC"),
		   (02, "Departamento de Tecnologias da Informação", "DETIF"),
           (03, "Departamento da Engenharia da Automação", "DEPEA"),
           (04, "Departamento da Matemática Fincanceira", "DEMATF"),
		   (05, "Departamento da Física Quântica", "DEFISQ");

INSERT INTO docente (idDocente, nomeDocente, departamento_idDepartamento)
	VALUES (25, "Maria Chaves", 01),
           (16, "José da Silva", 02),
           (09, "Hugo Vinícius", 03),
           (11, "Angela de Toledo", 04),
		   (04, "Antônio Torres", 05);

INSERT INTO curso (idCurso, nomeCurso, departamento_idDepartamento)
	VALUES (03, "Probabilidade e Estatística", 01),
		   (12, "Análise e Desenvolvimento de Sistemas", 02),
		   (15, "Engenharia da Automação", 03),
           (05, "Matemática Financeira", 04),
           (20, "Bacharelado em Física", 05);

INSERT INTO disciplina (idDisciplina, nomeDisciplina, curso_idCurso)
	VALUES (101, "Combinação e Arranjo 1", 03),
		   (201, "Algoritmos", 12),
		   (301, "Introdução a Automação", 15),
           (102, "Cálculo 1", 05),
           (105, "Física Quântica Teórica", 20);

/* 
O DOCENTE 04 (ANTONIO TORRES) NAO ESTA VINCULADO E NENHUMA TURMA, LOGO NAO ESTA VINCULADO A UMA DISCIPLINA
A DISCIPLINA 105 NAO POSSUI TURMA VINCULADA A ELA
*/
INSERT INTO turma (idTurma, numDiscentesTurma, docente_idDocente, disciplina_idDisciplina)
	VALUES (1001, 30, 25, 101),
		   (1002, 27, 25, 101),
           (1101, 25, 16, 201),
           (1201, 20, 09, 301),
           (1301, 34, 11, 102);

INSERT INTO laboratorio (idLaboratorio, qtdLugaresLaboratorio, qtdComputadoresLaboratorio, blocoLaboratorio_blocoLabId)
	VALUES (151, 40, 40, 01),
		   (162, 40, 40, 02),
           (173, 30, 30, 03),
           (184, 30, 30, 04),
           (195, 50, 50, 05);	
           
INSERT INTO reserva (turma_idTurma, laboratorio_idLaboratorio, dataInicioReserva, dataFimReserva)
	VALUES (1001, 151, 05/09/2020, 05/05/2021),
		   (1002, 162, 09/05/2020, 09/05/2020),
		   (1101, 173, 11/11/2021, 11/11/2022),
           (1201, 184, 10/08/2019, 10/08/2019),
           (1301, 195, 02/03/2018, 02/03/2019);

INSERT INTO computador (idComputador, descricaoComputador, desempenhoComputador, laboratorio_idLaboratorio)
	VALUES (200, "INTEL", "Regular", 151),
		   (220, "INTEL", "Bom", 162),
           (230, "AMD", "Ótimo", 173),
           (240, "AMD", "Regular", 184),
           (250, "Intel", "Bom", 195);

INSERT INTO programa (idProgramas, descricaoPrograma, computador_idComputador)
	VALUES (900, "Calculadora", 200),
		   (901, "Bloco de notas", 200),
           (902, "Data e hora", 230),
           (903, "Paint", 240),
           (904, "Captura de tela", 250);