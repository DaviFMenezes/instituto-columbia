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

O sistema foi desenvolvido utilizando arquitetura MVC com Java Web, Servlets, JSP, JDBC, PostgreSQL, Maven e Bootstrap.
