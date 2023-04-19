CREATE DATABASE IF NOT EXISTS trabalho_bd_codigo;

USE trabalho_bd_codigo;

CREATE TABLE IF NOT EXISTS blocoLaboratorio (
	blocoLabId INT NOT NULL,
	blocoLabNome VARCHAR(45) NOT NULL,
	PRIMARY KEY (blocoLabId)
  );

CREATE TABLE IF NOT EXISTS departamento (
	idDepartamento INT NOT NULL,
	nomeDepartamento VARCHAR(45) NOT NULL,
	siglaDepartamento VARCHAR(45) NOT NULL,
	PRIMARY KEY (idDepartamento)
);

CREATE TABLE IF NOT EXISTS instituicao (
	blocoLaboratorio_blocoLabId INT NOT NULL,
	departamento_idDepartamento INT NOT NULL,
	PRIMARY KEY (blocoLaboratorio_blocoLabId, departamento_idDepartamento),
    
    FOREIGN KEY (blocoLaboratorio_blocoLabId)
		REFERENCES blocoLaboratorio (blocoLabId),
    FOREIGN KEY (departamento_idDepartamento)
		REFERENCES departamento (idDepartamento)
);

CREATE TABLE IF NOT EXISTS docente (
	idDocente INT NOT NULL,
	nomeDocente VARCHAR(45) NOT NULL,
	departamento_idDepartamento INT NOT NULL,
	PRIMARY KEY (idDocente),

	FOREIGN KEY (departamento_idDepartamento)
		REFERENCES departamento (idDepartamento)
 );

CREATE TABLE IF NOT EXISTS curso (
	idCurso INT NOT NULL,
	nomeCurso VARCHAR(45) NOT NULL,
	departamento_idDepartamento INT NOT NULL,
	PRIMARY KEY (idCurso),
    
	FOREIGN KEY (departamento_idDepartamento)
		REFERENCES departamento (idDepartamento)
);

CREATE TABLE IF NOT EXISTS disciplina (
	idDisciplina INT NOT NULL,
	nomeDisciplina VARCHAR(45) NOT NULL,
	curso_idCurso INT NOT NULL,
	PRIMARY KEY (idDisciplina),

	FOREIGN KEY (curso_idCurso)
		REFERENCES curso (idCurso)
);

CREATE TABLE IF NOT EXISTS turma (
	idTurma INT NOT NULL,
	numDiscentesTurma INT NOT NULL,
	docente_idDocente INT NOT NULL,
	disciplina_idDisciplina INT NOT NULL,
	PRIMARY KEY (idTurma),
    
	FOREIGN KEY (docente_idDocente)
		REFERENCES docente (idDocente),
	FOREIGN KEY (disciplina_idDisciplina)
		REFERENCES disciplina (idDisciplina)
);

CREATE TABLE IF NOT EXISTS laboratorio (
	idLaboratorio INT NOT NULL,
	qtdLugaresLaboratorio INT NOT NULL,
	qtdComputadoresLaboratorio INT NOT NULL,
	blocoLaboratorio_blocoLabId INT NOT NULL,
	PRIMARY KEY (idLaboratorio),
    
    FOREIGN KEY (blocoLaboratorio_blocoLabId)
		REFERENCES blocoLaboratorio (blocoLabId)
);


CREATE TABLE IF NOT EXISTS reserva (
	turma_idTurma INT NOT NULL,
	laboratorio_idLaboratorio INT NOT NULL,
	dataInicioReserva DATE NOT NULL,
	dataFimReserva DATE NOT NULL,
	PRIMARY KEY (laboratorio_idLaboratorio),
    
    FOREIGN KEY (turma_idTurma)
		REFERENCES turma (idTurma),
    FOREIGN KEY (laboratorio_idLaboratorio)
		REFERENCES laboratorio (idLaboratorio)
);

CREATE TABLE IF NOT EXISTS computador (
	idComputador INT NOT NULL,
	descricaoComputador VARCHAR(45) NOT NULL,
	desempenhoComputador VARCHAR(45) NOT NULL,
	laboratorio_idLaboratorio INT NOT NULL,
	PRIMARY KEY (idComputador),
    
    FOREIGN KEY (laboratorio_idLaboratorio)
		REFERENCES laboratorio (idLaboratorio)
);

CREATE TABLE IF NOT EXISTS programa (
	idProgramas INT NOT NULL,
	descricaoPrograma VARCHAR(45) NOT NULL,
	computador_idComputador INT NOT NULL,
	PRIMARY KEY (idProgramas),
	
    FOREIGN KEY (computador_idComputador)
		REFERENCES computador (idComputador)
);