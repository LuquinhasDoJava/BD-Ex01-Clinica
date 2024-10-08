CREATE DATABASE clinica
GO
use clinica
Go
CREATE TABLE paciente (
num_beneficiario	INT				NOT NULL,
nome				VARCHAR(100)	NOT NULL,
logradouro			VARCHAR(200)	NOT NULL,
numero				INT				NOT NULL,
cep					CHAR(8)			NOT NULL,
complemento			VARCHAR(255)	NOT NULl,
telefone			VARCHAR(11)		NOT NULL
PRIMARY KEY (num_beneficiario)
)
GO
CREATE TABLE especialidade(
id			  INT			NOT NULL,
especialidade VARCHAR(100)	NOT NULL
PRIMARY KEY (id)
)
GO
CREATE TABLE medico(
codigo_medico	INT				NOT NULL,
nome			VARCHAR(100)	NOT NULL,
logradouro		VARCHAR(200)	NOT NULL,
numero			INT				NOT NULL,
cep				CHAR(8)			NOT NULL,
complemento		VARCHAR(255)	NOT NULL,
contato			INT				NOT NULL,
especialidade	INT				NOT NULL
PRIMARY KEY (codigo_medico)
FOREIGN KEY (especialidade) REFERENCES especialidade(id)
)

GO

CREATE TABLE consulta (
num_benef		INT				NOT NULL,
codigo_med		INT				NOT NULL,
data_hora		DATE			NOT NULL, --TIMESTAMP não tava funcionando para mim.
observacao		VARCHAR(255)	NOT NULL
PRIMARY KEY (data_hora, num_benef, codigo_med)
FOREIGN KEY (num_benef) REFERENCES paciente(num_beneficiario),
FOREIGN KEY (codigo_med) REFERENCES medico(codigo_medico)
)
go
INSERT INTO paciente VALUES (99901,'Washington Silva','R.Anhaia',150,'02345000','Casa','922229999')
INSERT INTO paciente VALUES (99902,'Luis Ricardo','R.Voluntários da Pátria',2251,'03254010','Bloco B.Apto 25','923450987')
INSERT INTO paciente VALUES (99903,'Maria Elisa','Av.Aguia de Haia',1188,'06987020','Apto 1208','912348765')
INSERT INTO paciente VALUES (99904,'José Araujo','R.XV de Novembro',18,'03678000','Casa','945674321')
INSERT INTO paciente VALUES (99905,'Joana Paula','R.7 de Abril',97,'01214000','Conjunto 3 - Apto 801','912095674')

INSERT INTO medico VALUES (100001,'Ana Paula','R.7 de Setembro',256,'03698000','Casa',915689456,1)
INSERT INTO medico VALUES (100002,'Maria Aparecida','Av.Brasil',32,'02145070','Casa',923235454,1)
INSERT INTO medico VALUES (100003,'Lucas Borges','Av. do Estado',3210,'05241000','Apto 205',963698585,2)
INSERT INTO medico VALUES (100004,'Gabriel Oliveira','Av.Dom Helder Camara',350,'03145000','Apto 602',932458745,3)

INSERT INTO	especialidade VALUES (1,'Otorrinolaringologista')
INSERT INTO	especialidade VALUES (2,'Urologista')
INSERT INTO	especialidade VALUES (3,'Geriatra')
INSERT INTO	especialidade VALUES (4,'Pediatra')

INSERT INTO consulta VALUES (99901, 100002, '2023-10-07','Infecção Urina')
INSERT INTO consulta VALUES (99902,100003,'2021-09-04','Gripe')
INSERT INTO consulta VALUES (99901,100001,'2021-09-04','Infecção Garganta')

ALTER TABLE medico ADD dia_atendimento VARCHAR(50)

UPDATE medico SET dia_atendimento  = 'Segunda-Feira' WHERE codigo_medico = 100001 
UPDATE medico SET dia_atendimento  = 'Quarta-Feira'  WHERE codigo_medico = 100002
UPDATE medico SET dia_atendimento  = 'Quinta-Feira'  WHERE codigo_medico = 100004
UPDATE medico SET dia_atendimento  = 'Segunda-Feira'  WHERE codigo_medico = 100003

DELETE especialidade WHERE id = 4


EXEC sp_rename 'medico.dia_atendimento', 'dia_semana_atendimento', 'COLUMN'

UPDATE medico SET logradouro = 'Av. Bras Leme', numero = 876, cep = 02122000, complemento = 'apto 504' WHERE codigo_medico = 100003

ALTER TABLE consulta ALTER COLUMN observacao VARCHAR(200)


SELECT * FROM paciente
SELECT * FROM medico
SELECT * FROM especialidade
SELECT * FROM consulta

EXEC sp_help 'consulta';