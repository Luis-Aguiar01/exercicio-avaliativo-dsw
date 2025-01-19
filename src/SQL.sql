CREATE TABLE IF NOT EXISTS usuario (
	email VARCHAR(50) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	senha VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido (
	id_pedido INT PRIMARY KEY,
	nome_cliente VARCHAR(100) NOT NULL,
	endereco_entrega VARCHAR(200) NOT NULL,
	valor DECIMAL(10, 2) NOT NULL,
	descricao VARCHAR(300),
	email_usuario VARCHAR(50) NOT NULL,
	FOREIGN KEY (email_usuario) REFERENCES usuario(email)
	ON UPDATE CASCADE ON DELETE CASCADE
);