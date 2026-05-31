Criar Banco de Dados - "instituto_columbia"

```
CREATE TABLE IF NOT EXISTS public.usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    permissao VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.projetos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    descricao TEXT NOT NULL,
    imagem_url TEXT,
    data_inicio DATE NOT NULL,
    data_termino DATE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    categoria VARCHAR(50) NOT NULL,
    id_usuario INTEGER NOT NULL DEFAULT 1,
    CONSTRAINT fk_projetos_usuarios FOREIGN KEY (id_usuario)
        REFERENCES public.usuarios (id) 
        ON UPDATE NO ACTION 
        ON DELETE SET DEFAULT
);

CREATE TABLE IF NOT EXISTS public.mensagens (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    assunto VARCHAR(200),
    mensagem TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO public.usuarios (nome, email, senha, permissao)
VALUES ('Teste', 'teste@columbia.com', '1234', 'ADMIN');

```
