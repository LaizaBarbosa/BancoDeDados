CREATE DATABASE bancoClinica;

USE bancoClinica;

create table Sala(
	numeroSala INT PRIMARY KEY NOT NULL,
    CHECK(numeroSala >= 1 and numeroSala <=50),
    andar INT UNIQUE NOT NULL 
    CHECK(andar < 12)
);

create table Medico(
	CRM varchar(15) PRIMARY KEY NOT NULL,
    nome varchar(40) NOT NULL,
    idade int,
    CHECK(idade > 23),
    especialidade char(20) NOT NULL DEFAULT "Ortopedia",
    cpf varchar(15) UNIQUE NOT NULL,
    dataAdmissao date,
    Fk_Sala INT UNIQUE NOT NULL,
    foreign key(Fk_Sala) references Sala(numeroSala)
);

create table Paciente(
	RG varchar(15) PRIMARY KEY UNIQUE NOT NULL,
    nome varchar(40) NOT NULL,
    dataNascimento date,
    cidade char(30) DEFAULT "Itabuna",
    doenca varchar(40) NOT NULL,
    planoSaude varchar(40) NOT NULL DEFAULT "SUS"
);

create table Funcionario(
	matricula varchar(15) PRIMARY KEY NOT NULL,
    nome varchar(40) NOT NULL,
    dataNascimento date NOT NULL,
    dataAdmissao date NOT NULL,
    cargo varchar(40) NOT NULL DEFAULT "Assistente médico",
    salario float NOT NULL DEFAULT "510.00"
);

create table Consulta(
	codigoConsulta int PRIMARY KEY NOT NULL,
    dataHorario datetime,
    fk_CRM varchar(15) UNIQUE NOT NULL,
    foreign key(fk_CRM) references Medico(CRM),
    fk_pacienteRG varchar(15) UNIQUE NOT NULL,
    foreign key(fk_pacienteRG) references Paciente(RG)
);
