# Descrição do Sistema

O sistema foi desenvolvido para o gerenciamento institucional de projetos voltados à criação e administração de projetos de lei de incentivo cultural, esportivo e social.

A aplicação permite o gerenciamento de:

* projetos;
* usuários;
* mensagens enviadas pela página pública do sistema.

O sistema possui uma área pública, onde visitantes podem enviar mensagens através de um formulário de contato sem necessidade de autenticação.

As mensagens enviadas são direcionadas para a área administrativa do sistema, onde podem ser visualizadas e gerenciadas pelos usuários autorizados.

A área administrativa possui três CRUDs principais:

* CRUD de Projetos;
* CRUD de Usuários;
* CRUD de Mensagens.

O controle de acesso é realizado através de autenticação e permissões de usuário.

Os usuários são classificados conforme seu nível de permissão:

* Administrador (ADMIN): possui acesso completo ao sistema, incluindo gerenciamento de usuários, mensagens e projetos;
* Editor: possui acesso apenas ao gerenciamento de projetos.

Os projetos cadastrados podem ser visualizados por todos os usuários autenticados da área administrativa. Entretanto, cada usuário pode editar e excluir apenas os projetos criados por ele próprio, exceto administradores, que possuem acesso total.

# Para rodar crie o banco de dados.

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
