CREATE DATABASE revendedora;
USE revendedora;

CREATE TABLE cliente(
	Id VARCHAR(10) PRIMARY KEY NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    telefone VARCHAR(9) UNIQUE NOT NULL,
    endereco VARCHAR(60) NOT NULL
);

CREATE TABLE vendedor(
	Id VARCHAR(4) PRIMARY KEY NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    telefone VARCHAR(9) UNIQUE NOT NULL,
    salario FLOAT NOT NULL,
    dataAdmissao DATE NOT NULL
);

CREATE TABLE negocio(
	ID VARCHAR(4) PRIMARY KEY NOT NULL,
    dataVenda DATE NOT NULL,
    precoPago FLOAT NOT NULL,
    idVendedor VARCHAR(4) UNIQUE NOT NULL,
    idComprador VARCHAR(10) UNIQUE NOT NULL, 
    automovel CHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY(idVendedor) references vendedor(Id),
    FOREIGN KEY(idComprador) references cliente(Id),
    FOREIGN KEY(automovel) references carro(renavam)
);

CREATE TABLE carro(
	renavam CHAR(10) PRIMARY KEY NOT NULL,
    placa VARCHAR(7) UNIQUE NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    marca VARCHAR(15) NOT NULL,
    anoFabricacao YEAR NOT NULL,
    cor VARCHAR(15) NOT NULL,
    numPortas INT NOT NULL DEFAULT 2,
    motor VARCHAR(10) NOT NULL,
    preco FLOAT NOT NULL,
    combustivel VARCHAR(20) NOT NULL DEFAULT "gasolina"
);