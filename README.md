# Painel de Controle de Licenças

Plataforma web para controle de licenças de software, acompanhada de componente e aplicação de demonstração em Delphi.

## Recursos

- Liberação e bloqueio de licenças online e offline
- Cadastro de clientes, revendas, sistemas e usuários
- Controle financeiro e valores individuais de licença
- Controle da quantidade de estações liberadas por cliente
- Associação de clientes às revendas
- Permissões separadas para administradores e revendas
- Consulta e manutenção das liberações em uma única plataforma web

## Tecnologias

- PHP
- MySQL / MariaDB
- HTML, CSS e JavaScript
- Delphi VCL
- Firebird na aplicação de demonstração

## Conteúdo

- Plataforma web em PHP
- Esquema SQL sem dados pessoais
- Componente de licenciamento para Delphi
- Código-fonte da aplicação de demonstração

## Instalação da plataforma web

1. Importe `banco/liberacao.sql` em uma base MySQL ou MariaDB vazia.
2. Copie `src/CLASSES/conexao.example.php` para `src/CLASSES/conexao.php`.
3. Edite o novo arquivo com o servidor, usuário, senha e nome da sua base.
4. Publique o conteúdo de `src` em um servidor com PHP e extensão MySQLi.

O arquivo de conexão real é ignorado pelo Git para evitar o envio acidental de credenciais.

## Demonstração Delphi

O banco Firebird original não faz parte do repositório porque continha dados locais. Configure uma base própria e ajuste a conexão no projeto `demo/DemoPlataforma.dproj` antes de executar.

## Imagens

![Painel de controle de licenças 1](img/img02.jpg)

![Painel de controle de licenças 2](img/img03.jpg)

![Painel de controle de licenças 3](img/img04.jpg)

![Painel de controle de licenças 4](img/img05.jpg)

![Painel de controle de licenças 5](img/img06.jpg)

![Painel de controle de licenças 6](img/img07.jpg)

![Painel de controle de licenças 7](img/img08.jpg)

![Painel de controle de licenças 8](img/img11.jpg)

![Painel de controle de licenças 9](img/img12.jpg)

![Painel de controle de licenças 10](img/img13.jpg)

![Painel de controle de licenças 11](img/img14.jpg)

![Painel de controle de licenças 12](img/img15.jpg)

![Painel de controle de licenças 13](img/img16.jpg)

![Painel de controle de licenças 14](img/img17.jpg)

![Painel de controle de licenças 15](img/img18.jpg)

![Painel de controle de licenças 16](img/img19.jpg)

## Segurança

O dump SQL foi disponibilizado somente com a estrutura das tabelas. Usuários, senhas, hashes, sessões, endereços IP e demais registros do ambiente original foram removidos.

## Observação

Projeto independente para estudo, personalização e evolução pela comunidade. Delphi, Firebird, PHP e MySQL são marcas de seus respectivos proprietários.
