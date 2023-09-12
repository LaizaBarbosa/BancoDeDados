CREATE DATABASE banco2;

USE banco2;

-- exercicio 13
CREATE TABLE  paises(
	countryId char(4) NOT NULL UNIQUE DEFAULT "",
    countryName varchar(40) DEFAULT NULL,
    regionId char(10) NOT NULL, 
    
    -- chave primária com as colunas COUNTRYID e REGIONID
    primary key(countryId, regionId)
);

-- exercicio 14
CREATE TABLE jobs(
	jobId char(4) NOT NULL PRIMARY KEY,
    jobName varchar(40) NOT NULL
);

CREATE TABLE jobHistory(
	pk_employeeId char(4) NOT NULL PRIMARY KEY,
    startDate date NOT NULL,
    endDate date NOT NULL,
    fk_jobId char(4) NOT NULL,
    departamentID char(4) DEFAULT NULL,
    
    -- definição da chave estrangeira 
    foreign key(fk_jobId) references jobs(jobId)
);

create table employee(
	employeeID varchar(10) not null unique primary key,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    jobId char(4) not null unique,
    salario float not null,
    foreign key (jobId) references jobs(jobId)
    
    -- atualiza nas duas tabelas
    ON UPDATE CASCADE
    -- rejeita exclusôes
    ON DELETE RESTRICT
);

create table employee2(
	employeeID varchar(10) not null unique primary key,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    jobId char(4) not null unique,
    salario float not null,
    foreign key (jobId) references jobs(jobId)
    
    -- exclui dados nas duas tabelas
    ON DELETE CASCADE
    -- rejeita atualização
    ON UPDATE RESTRICT
);

create table employee3(
	employeeID varchar(10) not null unique primary key,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    jobId char(4) not null unique,
    salario float not null,
    foreign key (jobId) references jobs(jobId)
    
    -- rejeitão atualizações e exclusôes na tabela
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);




