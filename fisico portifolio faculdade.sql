 CREATE DATABASE faculdade;
 
USE faculdade; 

CREATE TABLE aluno (
 id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(50),
 cpf VARCHAR(45),
 notas INT);
 
CREATE TABLE email_aluno (
 id_email INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 email VARCHAR(255),
 fk_aluno INT);
 
ALTER TABLE email_aluno ADD CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES aluno(id_aluno); 

CREATE TABLE telefone_aluno (
 id_telefone INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 telefone INT(12),
 fk_aluno INT);
 
ALTER TABLE telefone_aluno ADD CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES aluno(id_aluno);

CREATE TABLE endereco_aluno (
 id_endereco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 bairro VARCHAR(100),
 cep INT,
 logradouro VARCHAR(100),
 pais VARCHAR(100),
 estado VARCHAR(100),
 cidade VARCHAR(100),
 fk_aluno INT);
 
 ALTER TABLE endereco_aluno ADD CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES aluno(id_aluno); 

CREATE TABLE professor (
 id_professor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 nome_professor VARCHAR(45),
 cpf VARCHAR(45),
 especialidade VARCHAR(45));
 
CREATE TABLE telefone_professor (
 id_telefone INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 telefone INT(12),
 fk_professor INT);
 
ALTER TABLE telefone_professor ADD CONSTRAINT FOREIGN KEY (fk_professor)
REFERENCES professor(id_professor); 

CREATE TABLE email_professor (
 id_email INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 email VARCHAR(255),
 fk_professor INT);
 
ALTER TABLE email_professor ADD CONSTRAINT FOREIGN KEY (fk_professor)
REFERENCES professor(id_professor);

CREATE TABLE endereco_professor (
 id_endereco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 bairro VARCHAR(100),
 cep INT,
 logradouro VARCHAR(100),
 pais VARCHAR(100),
 estado VARCHAR(100),
 cidade VARCHAR(100),
 fk_professor INT);
 
ALTER TABLE endereco_professor ADD CONSTRAINT FOREIGN KEY (fk_professor)
REFERENCES professor(id_professor);

CREATE TABLE turmas (
 id_turma INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 numero_turma INT(20),
 hora_inicio_manha TIME,
 hora_fim_manha TIME,
 hora_inicio_noite TIME,
 hora_fim_noite TIME,
 turno VARCHAR(45));
 
CREATE TABLE turma_aluno (
 fk_turma INT,
 fk_aluno INT);
 
ALTER TABLE turma_aluno ADD CONSTRAINT FOREIGN KEY (fk_turma)
REFERENCES turmas(id_turma);

ALTER TABLE turma_aluno ADD CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES aluno(id_aluno);

CREATE TABLE disciplinas (
 id_disciplina INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 nome_disciplina VARCHAR(45),
 atividades VARCHAR(45),
 trabalhos VARCHAR(45),
 provas VARCHAR(45));
 
 CREATE TABLE cursos (
 id_curso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nome_curso VARCHAR(45),
 inicio_curso DATE,
 fim_curso DATE,
 mensalidade DECIMAL(10,2),
 semestres INT(20));
 
CREATE TABLE disciplinas_cursos (
 fk_disciplina INT, 
 fk_curso INT);
 
ALTER TABLE disciplinas_cursos ADD CONSTRAINT FOREIGN KEY (fk_disciplina)
REFERENCES disciplinas(id_disciplina);

ALTER TABLE disciplinas_cursos ADD CONSTRAINT FOREIGN KEY (fk_curso)
REFERENCES cursos(id_curso); 

CREATE TABLE cantina (
 id_cantina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 data_hora_compra DATETIME,
 itens VARCHAR(1000),
 estoque VARCHAR(1000),
 preco DECIMAL(10,2),
 vendas INT,
 fk_aluno INT);
 
ALTER TABLE cantina ADD CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES aluno(id_aluno);

CREATE TABLE forma_pagamento (
 id_forma_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 pix DECIMAL(10,2),
 dinheiro DECIMAL(10,2),
 cartao_credito DECIMAL(10,2),
 cartao_debito DECIMAL(10,2),
 fk_cantina INT);
 
 ALTER TABLE forma_pagamento ADD CONSTRAINT FOREIGN KEY (fk_cantina)
REFERENCES cantina(id_cantina);

CREATE TABLE biblioteca (
 isbn INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(45),
 genero VARCHAR(45),
 disponibilidade_livro VARCHAR(45),
 data_publicacao DATE); 
 
 CREATE TABLE matricula (
 id_matricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 data_matricula DATE,
 status_matricula VARCHAR(45),
 curso VARCHAR(255),
 fk_aluno INT,
 fk_curso INT);
 
ALTER TABLE matricula ADD CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES aluno(id_aluno);

ALTER TABLE matricula ADD CONSTRAINT FOREIGN KEY (fk_curso)
REFERENCES cursos(id_curso);
