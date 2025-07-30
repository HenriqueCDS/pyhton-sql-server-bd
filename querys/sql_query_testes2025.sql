USE master;
GO

USE teste1;

SELECT name 
FROM sys.tables;

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'aluno' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE aluno (
        CodAluno INT PRIMARY KEY IDENTITY(1,1),
        nome VARCHAR(100),
        idade INT,
        sexo VARCHAR(100),
        email VARCHAR(100),
        cidade VARCHAR(100),
        cpf VARCHAR(100)
    );
END

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'curso' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE curso (
        CodCurso INT PRIMARY KEY IDENTITY(1,1),
        nome VARCHAR(100),
    );
END

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'disciplina' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE disciplina (
        CodDisciplina INT PRIMARY KEY IDENTITY(1,1),
        nome VARCHAR(100),
    );
END

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'disciplina_curso' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE disciplina_curso (
        CodDisciplina_Curso INT PRIMARY KEY IDENTITY(1,1),
		CodCurso INT,
        FOREIGN KEY (CodCurso) REFERENCES curso(CodCurso),
		CodDisciplina INT,
		FOREIGN KEY (CodDisciplina) REFERENCES disciplina(CodDisciplina)
    );
END

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'GradeNotaFaltaPeriodo' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE GradeNotaFaltaPeriodo (
        CodGradeNotaFaltaPeriodo INT PRIMARY KEY IDENTITY(1,1),
		nota FLOAT,
		falta INT,
		periodo VARCHAR(100),
		data DATETIME,
		situacao VARCHAR(100),
		CodDisciplina INT,
		FOREIGN KEY (CodDisciplina) REFERENCES disciplina(CodDisciplina),
		CodAluno INT,
		FOREIGN KEY (CodAluno) REFERENCES aluno(CodAluno)
    );
END














