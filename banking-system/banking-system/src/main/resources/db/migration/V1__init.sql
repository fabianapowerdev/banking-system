CREATE TABLE clientes (
                          cliente_id INT PRIMARY KEY AUTO_INCREMENT,
                          nome VARCHAR(100) NOT NULL,
                          cpf VARCHAR(14) UNIQUE NOT NULL,
                          endereco VARCHAR(255),
                          telefone VARCHAR(20),
                          email VARCHAR(100),
                          data_nascimento DATE
);
CREATE TABLE contas (
                        conta_id INT PRIMARY KEY AUTO_INCREMENT,
                        cliente_id INT,
                        numero_conta VARCHAR(20) UNIQUE NOT NULL,
                        tipo_conta VARCHAR(50),
                        saldo DECIMAL(15,2) DEFAULT 0,
                        data_abertura DATE,

                        FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);
CREATE TABLE transacoes (
                            transacao_id INT PRIMARY KEY AUTO_INCREMENT,
                            conta_id INT,
                            tipo_transacao VARCHAR(50),
                            valor DECIMAL(15,2),
                            data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            descricao VARCHAR(255),

                            FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);
CREATE TABLE cartoes (
                         cartao_id INT PRIMARY KEY AUTO_INCREMENT,
                         conta_id INT,
                         numero_cartao VARCHAR(20),
                         validade DATE,
                         cvv VARCHAR(4),
                         limite_credito DECIMAL(15,2),

                         FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);
CREATE TABLE agencias (
                          agencia_id INT PRIMARY KEY AUTO_INCREMENT,
                          nome_agencia VARCHAR(100),
                          endereco VARCHAR(255)
);
CREATE TABLE autorizados (
                             autorizado_id INT PRIMARY KEY AUTO_INCREMENT,
                             conta_id INT,
                             nome_autorizado VARCHAR(100),
                             tipo_autorizacao VARCHAR(50),
                             data_inicio DATE,
                             data_fim DATE,

                             FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);
CREATE TABLE usuarios (
                          usuario_id INT PRIMARY KEY AUTO_INCREMENT,
                          cliente_id INT,
                          papel VARCHAR(20),
                          login VARCHAR(50) UNIQUE,
                          senha_hash VARCHAR(255),

                          FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);