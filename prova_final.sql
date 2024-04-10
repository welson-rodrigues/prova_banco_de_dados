-- LINK DO VÍDEO https://youtu.be/DsvBcA0hxog?feature=shared

-- QUESTÃO 01
CREATE TABLE Autor (
	autor_id SERIAL PRIMARY KEY,
	nome VARCHAR(50)
);

CREATE TABLE Livro (
	livro_id SERIAL PRIMARY KEY,
	isbn TEXT NOT NULL,
	ano INT NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	autor_id INT REFERENCES Autor (autor_id)
);

CREATE TABLE Usuario (
	usuario_id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL
);

CREATE TABLE Emprestimo (
	DataDevolucao DATE NOT NULL,
	DataEmprestimo DATE NOT NULL,
	usuario_id INT,
	livro_id INT,
	FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id),
	FOREIGN KEY (livro_id) REFERENCES Livro (livro_id)
);

-- QUESTÃO 02
CREATE TABLE Categoria (
	categoria_id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL
);

INSERT INTO Categoria (nome) VALUES
('Romance'),
('Ficção Científica');

ALTER TABLE Livro
ADD COLUMN categoria_id INT;

ALTER TABLE Livro
ADD FOREIGN KEY (categoria_id) REFERENCES Categoria (categoria_id);

-- QUESTÃO 03
INSERT INTO Autor (nome) VALUES
('Machado de Assis'),
('George Orwell'),
('Jane Austen');

INSERT INTO Livro (titulo, isbn, ano, autor_id, categoria_id) VALUES
('Dom Casmurro', '978-85-66250-05-4', 1899, 1, 1),
('1984', '978-0-452-28423-4', 1949, 2, 2),
('Orgulho e Preconceito', '978-85-8057-256-2', 1813, 3, 1);

INSERT INTO Usuario (nome, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('Carlos Santos', 'carlos.santos@email.com'),
('Mariana Oliveira', 'mariana.oliveira@email.com');

INSERT INTO Emprestimo (DataDevolucao, DataEmprestimo, usuario_id, livro_id) VALUES
('2024-02-15', '2024-01-15', 1, 1),
('2024-02-20', '2024-01-20', 2, 2),
('2024-02-25', '2024-01-25', 3, 3);

-- QUESTÃO 04
-- Atualize o ano de publicação do livro "1984" para 1950.
UPDATE Livro
	SET ano = 1950
WHERE livro_id = 2;

-- Atualize o e-mail do usuário "Carlos Santos" para "carlos.santos@novomail.com".
UPDATE Usuario
	SET email = 'carlos.santos@novomail.com'
WHERE usuario_id = 2;

-- Atualize a data de devolução do empréstimo com ID 10001 para '2024-02-20'.
UPDATE Emprestimo
	SET DataDevolucao = '2024-02-20'
WHERE usuario_id = 1;

-- QUESTÃO 05
-- Selecione os livros publicados após o ano de 1900, ordenados por ano de publicação.
SELECT * FROM Livro
	WHERE ano > 1900
ORDER BY ano;

-- Encontre os usuários cujos nomes começam com 'M' e têm um e-mail contendo 'email'.
SELECT * FROM Usuario
	WHERE nome ILIKE 'M%'
AND email ILIKE '%email%';

-- Selecione os livros em que o título contém a palavra 'Preconceito' e foram publicados antes de 2000
SELECT * FROM Livro
	WHERE titulo ILIKE '%Preconceito%'
AND ano < 2000;

--Selecione os livros publicados entre 1800 e 1900
SELECT * FROM Livro
	WHERE ano >= 1800
AND ano <= 1900;

SELECT * FROM Livro;
SELECT * FROM Autor;
SELECT * FROM Usuario;
SELECT * FROM Emprestimo;
SELECT * FROM Categoria;