CREATE TABLE CATEGORIA_PRODUTOS(
    ID_CATEGORIA INTEGER NOT NULL,
    NOME TEXT,
    
    CONSTRAINT PK_CATEGORIA_PRODUTOS PRIMARY KEY(ID_CATEGORIA)
);
 
CREATE TABLE FORNECEDORES (
    ID_FORNECEDORES INTEGER NOT NULL,
    NOME TEXT,
    TELEFONE INTEGER,
    EMAIL TEXT,
    FK_ENDERECO INTEGER,
    
    CONSTRAINT PK_FORNCEDORES PRIMARY KEY (ID_FORNECEDORES),
    CONSTRAINT FK_FORNCEDORES_X_ENDERECO FOREIGN KEY (FK_ENDERECO) REFERENCES ENDERECO (ID_ENDERECO) 
);

CREATE TABLE ENDERECO(
    ID_ENDERECO INTEGER NOT NULL,
    RUA TEXT,
    BAIRRO TEXT,
    NUMERO INTEGER,
    CEP INTEGER,
    
    CONSTRAINT PK_ENDERECO PRIMARY KEY (ID_ENDERECO)
);

CREATE TABLE PRODUTO(
    ID_PRODUTO INTEGER NOT NULL,
    NOME TEXT,
    PRECO REAL,
    FK_FORNECEDORES INTEGER NOT NULL,
    FK_CATEGORIA_PRODUTOS INTEGER NOT NULL,
    QTD INTEGER TEXT,
    
    CONSTRAINT PK_PRODUTO PRIMARY KEY(ID_PRODUTO),
    CONSTRAINT FK_PRODUTO_X_FORNCEDORES FOREIGN KEY (FK_FORNECEDORES) REFERENCES FORNECEDORES (ID_FORNECEDORES),
    CONSTRAINT FK_PRODUTO_X_CATEGORIA_PRODUTOS FOREIGN KEY (FK_CATEGORIA_PRODUTOS) REFERENCES CATEGORIA_PRODUTOS (ID_CATEGORIA)
);


CREATE TABLE VENDASXPRODUTOS(
    ID_VENDAS INTEGER NOT NULL,
    FK_PRODUTO INTEGER NOT NULL,
    QTD_COMPRADA INTEGER,
    
    CONSTRAINT PK_VENDASXPRODUTOS PRIMARY KEY (ID_VENDAS),
    CONSTRAINT FK_VENDASXPRODUTOS_X_PRODUTO FOREIGN KEY (FK_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

CREATE TABLE CLIENTES(
    ID_CLIENTES INTEGER NOT NULL,
    NOME TEXT,
    TELEFONE INTEGER,
    EMAIL TEXT,
    
    CONSTRAINT PK_CLIENTES PRIMARY KEY (ID_CLIENTES)
);

CREATE TABLE CARGO(
    ID_CARGO INTEGER NOT NULL,
    NOME TEXT,
    VALOR_POR_HORA REAL,
    
    CONSTRAINT PK_CARGO PRIMARY KEY (ID_CARGO)
);

CREATE TABLE FUNCIONARIOS(
    ID_FUNCIONARIOS INTEGER NOT NULL,
    NOME TEXT,
    TELEFONE INTEGER,
    EMAIL TEXT,
    FK_CARGO INTEGER,
    DATA_CONTRATACAO DATE,
    FK_ENDERECO INTEGER,
    
    CONSTRAINT PK_FUNCIONARIOS PRIMARY KEY (ID_FUNCIONARIOS),
    CONSTRAINT FK_FUNCIONARIOS_X_CARGO FOREIGN KEY (FK_CARGO) REFERENCES CARGO (ID_CARGO),
    CONSTRAINT FK_FUNCIONARIOS_X_ENDERECO FOREIGN KEY (FK_ENDERECO) REFERENCES ENDERECO (ID_ENDERECO)
);

CREATE TABLE VENDAS(
    ID_VENDAS INTEGER NOT NULL,
    DATA_VENDA DATE,
    FK_PRODUTO INTEGER,
    FK_CLIENTES INTEGER,
    FK_FUNCIONARIOS INTEGER,
    VALOR_TOTAL_COMPRA REAL,
    
    CONSTRAINT PK_VENDAS PRIMARY KEY (ID_VENDAS),
    CONSTRAINT FK_VENDAS_X_PRODUTO FOREIGN KEY (FK_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO),
    CONSTRAINT FK_VENDAS_X_CLIENTES FOREIGN KEY (FK_CLIENTES) REFERENCES CLIENTES (ID_CLIENTES),
    CONSTRAINT FK_VENDAS_X_FUNCIONARIOS FOREIGN KEY (FK_FUNCIONARIOS) REFERENCES FUNCIONARIOS (ID_FUNCIONARIOS)
);

INSERT INTO CARGO (NOME, VALOR_POR_HORA) VALUES
    ('GERENTE', 20.80),
     ('SUB_GERENTE', 15.00),
      ('VENDEDOR', 11.65),
       ('ESTOQUISTA', 10.00),
        ('CAIXA', 09.80);
        
SELECT * FROM CARGO;

INSERT INTO CATEGORIA_PRODUTOS (NOME) VALUES
    ('LIMPEZA'),
    ('COMIDAS_CONGELADAS'),
    ('COMIDAS_FRESCAS'),
    ('VERDURAS'),
    ('VEGETAIS'),
    ('FRUTAS'),
    ('HIGIENE_PESSOAL'),
    ('BEBIDAS');
    
SELECT * FROM CATEGORIA_PRODUTOS;

INSERT INTO CLIENTES (NOME, TELEFONE , EMAIL) VALUES
    ('João Silva', '(11) 98765-4321', 'joao.silva@example.com'),
    ('Maria Santos', '(21) 99876-5432', 'maria.santos@example.com'),
    ('Pedro Souza', '(31) 91234-5678', 'pedro.souza@example.com'),
    ('Ana Oliveira', '(41) 92345-8765', 'ana.oliveira@example.com'),
    ('Lucas Pereira', '(51) 93456-7890', 'lucas.pereira@example.com'),
    ('Carla Rodrigues', '(71) 94567-8901', 'carla.rodrigues@example.com'),
    ('Gustavo Alves', '(81) 95678-9012', 'gustavo.alves@example.com'),
    ('Mariana Costa', '(91) 96789-0123', 'mariana.costa@example.com'),
    ('Rafael Mendes', '(12) 97890-1234', 'rafael.mendes@example.com'),
    ('Sofia Lima', '(22) 99012-3456', 'sofia.lima@example.com'),
    ('Fernando Castro', '(32) 90123-4567', 'fernando.castro@example.com'),
    ('Juliana Fernandes', '(42) 91234-5678', 'juliana.fernandes@example.com'),
    ('Leonardo Carvalho', '(52) 92345-6789', 'leonardo.carvalho@example.com'),
    ('Isabela Ribeiro', '(72) 93456-7890', 'isabela.ribeiro@example.com'),
    ('Thiago Santos', '(82) 94567-8901', 'thiago.santos@example.com'),
    ('Gabriela Pereira', '(92) 95678-9012', 'gabriela.pereira@example.com'),
    ('Bruno Almeida', '(13) 96789-0123', 'bruno.almeida@example.com'),
    ('Larissa Rocha', '(23) 99012-3456', 'larissa.rocha@example.com'),
    ('Eduardo Sousa', '(33) 90123-4567', 'eduardo.sousa@example.com'),
    ('Camila Lima', '(43) 91234-5678', 'camila.lima@example.com');

SELECT * FROM CLIENTES;

INSERT INTO ENDERECO (RUA, BAIRRO, NUMERO, CEP) VALUES
    ('Rua A', 'Bairro 1', '123', '12345-678'),
    ('Rua B', 'Bairro 2', '456', '23456-789'),
    ('Rua C', 'Bairro 3', '789', '34567-890'),
    ('Rua D', 'Bairro 4', '234', '45678-901'),
    ('Rua E', 'Bairro 5', '567', '56789-012'),
    ('Rua F', 'Bairro 6', '890', '67890-123'),
    ('Rua G', 'Bairro 7', '345', '78901-234'),
    ('Rua H', 'Bairro 8', '678', '89012-345'),
    ('Rua I', 'Bairro 9', '901', '90123-456'),
    ('Rua J', 'Bairro 10', '234', '12345-678'),
    ('Rua K', 'Bairro 11', '567', '23456-789'),
    ('Rua L', 'Bairro 12', '890', '34567-890'),
    ('Rua M', 'Bairro 13', '123', '45678-901'),
    ('Rua N', 'Bairro 14', '456', '56789-012'),
    ('Rua O', 'Bairro 15', '789', '67890-123'),
    ('Rua P', 'Bairro 16', '234', '78901-234'),
    ('Rua Q', 'Bairro 17', '567', '89012-345'),
    ('Rua R', 'Bairro 18', '890', '90123-456'),
    ('Rua S', 'Bairro 19', '901', '12345-678'),
    ('Rua T', 'Bairro 20', '234', '23456-789');

SELECT * FROM ENDERECO;

INSERT INTO FORNECEDORES (NOME, TELEFONE, EMAIL, FK_ENDERECO) VALUES
    ('Fornecedor 1', '(11) 9876-5432', 'fornecedor1@example.com', 1),
    ('Fornecedor 2', '(22) 8765-4321', 'fornecedor2@example.com', 2),
    ('Fornecedor 3', '(33) 7654-3210', 'fornecedor3@example.com', 3),
    ('Fornecedor 4', '(44) 6543-2109', 'fornecedor4@example.com', 4),
    ('Fornecedor 5', '(55) 5432-1098', 'fornecedor5@example.com', 5),
    ('Fornecedor 6', '(66) 4321-0987', 'fornecedor6@example.com', 6),
    ('Fornecedor 7', '(77) 3210-9876', 'fornecedor7@example.com', 7),
    ('Fornecedor 8', '(88) 2109-8765', 'fornecedor8@example.com', 8),
    ('Fornecedor 9', '(99) 1098-7654', 'fornecedor9@example.com', 9),
    ('Fornecedor 10', '(10) 0987-6543', 'fornecedor10@example.com', 10),
    ('Fornecedor 11', '(11) 9876-5432', 'fornecedor11@example.com', 11),
    ('Fornecedor 12', '(22) 8765-4321', 'fornecedor12@example.com', 12),
    ('Fornecedor 13', '(33) 7654-3210', 'fornecedor13@example.com', 13),
    ('Fornecedor 14', '(44) 6543-2109', 'fornecedor14@example.com', 14),
    ('Fornecedor 15', '(55) 5432-1098', 'fornecedor15@example.com', 15),
    ('Fornecedor 16', '(66) 4321-0987', 'fornecedor16@example.com', 16),
    ('Fornecedor 17', '(77) 3210-9876', 'fornecedor17@example.com', 17),
    ('Fornecedor 18', '(88) 2109-8765', 'fornecedor18@example.com', 18),
    ('Fornecedor 19', '(99) 1098-7654', 'fornecedor19@example.com', 19),
    ('Fornecedor 20', '(10) 0987-6543', 'fornecedor20@example.com', 20);
    
SELECT * FROM FORNECEDORES;

INSERT INTO FUNCIONARIOS (NOME, TELEFONE, EMAIL, FK_CARGO, DATA_CONTRATACAO, FK_ENDERECO) VALUES
    ('Funcionário 1', '(11) 9876-5432', 'funcionario1@example.com', 1, '2023-01-15', 1),
    ('Funcionário 2', '(22) 8765-4321', 'funcionario2@example.com', 2, '2023-02-20', 2),
    ('Funcionário 3', '(33) 7654-3210', 'funcionario3@example.com', 3, '2023-03-10', 3),
    ('Funcionário 4', '(44) 6543-2109', 'funcionario4@example.com', 4, '2023-04-05', 4),
    ('Funcionário 5', '(55) 5432-1098', 'funcionario5@example.com', 5, '2023-05-12', 5),
    ('Funcionário 6', '(66) 4321-0987', 'funcionario6@example.com', 1, '2023-06-25', 6),
    ('Funcionário 7', '(77) 3210-9876', 'funcionario7@example.com', 2, '2023-07-01', 7),
    ('Funcionário 8', '(88) 2109-8765', 'funcionario8@example.com', 3, '2023-08-18', 8),
    ('Funcionário 9', '(99) 1098-7654', 'funcionario9@example.com', 4, '2023-09-22', 9),
    ('Funcionário 10', '(10) 0987-6543', 'funcionario10@example.com', 5, '2023-10-30', 10);

SELECT * FROM FUNCIONARIOS

INSERT INTO PRODUTO (NOME, PRECO, FK_FORNECEDORES, FK_CATEGORIA_PRODUTOS, QTD) VALUES
    
