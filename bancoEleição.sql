CREATE DATABASE bancoEleicao;
USE bancoEleicao;

CREATE TABLE cargo(
	codigoCargo INT PRIMARY KEY NOT NULL,
    nomeCargo VARCHAR(30) UNIQUE NOT NULL
    CHECK(nomeCargo != "prefeito" OR "vereador"),
    salario FLOAT NOT NULL DEFAULT 17000,
    numVagas INT UNIQUE NOT NULL
);

CREATE TABLE candidato(
	numCandidato INT PRIMARY KEY NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    codigoCargo INT NOT NULL,
    codigoPartido INT NOT NULL,
    FOREIGN KEY (codigoCargo) REFERENCES cargo(codigoCargo),
    FOREIGN KEY (codigoPartido) REFERENCES partido(codigoPartido)
);

CREATE TABLE partido(
	codigoPartido INT PRIMARY KEY NOT NULL,
    sigla CHAR(5) UNIQUE NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    numero INT UNIQUE NOT NULL
);

CREATE TABLE eleitor(
	nome VARCHAR(40) NOT NULL,
    tituloEleitor VARCHAR(30) PRIMARY KEY NOT NULL,
    zonaEleitoral CHAR(5) NOT NULL,
    sessaoEleitoral CHAR(5) NOT NULL
);

CREATE TABLE voto(
	tituloEleitor VARCHAR(30) PRIMARY KEY NOT NULL,
    numCandidato INT NOT NULL,
    FOREIGN KEY (numCandidato) REFERENCES candidato(numCandidato),
    FOREIGN KEY (tituloEleitor) REFERENCES eleitor(tituloEleitor)
);

