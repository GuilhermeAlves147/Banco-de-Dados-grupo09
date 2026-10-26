# 🛒 Marketplace — Banco de Dados | Grupo 09

<p align="center">
  <strong>Projeto Final — Laboratório de Banco de Dados</strong>
  <br>
  Sistema de marketplace desenvolvido com MySQL para simular operações de comércio eletrônico.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=databricks&logoColor=white" alt="SQL">
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
</p>

---

## 📌 Sobre o projeto

Este projeto consiste no desenvolvimento de um banco de dados para um **sistema de marketplace**, simulando uma plataforma de comércio eletrônico na qual vendedores podem cadastrar e gerenciar produtos, enquanto clientes podem montar carrinhos de compras e realizar pedidos.

O trabalho contempla as principais etapas do desenvolvimento de um banco de dados relacional, desde a criação da estrutura até a inserção e consulta de informações.

### 🎯 Objetivos

- Modelar e implementar um banco de dados relacional.
- Criar tabelas e definir seus relacionamentos.
- Gerenciar vendedores, clientes, produtos e categorias.
- Representar fornecedores, carrinhos de compras e pedidos.
- Inserir dados para testar o funcionamento do banco.
- Desenvolver consultas SQL e views para verificar as informações.

---

## 🧩 Funcionalidades contempladas

| Módulo | Descrição |
|---|---|
| 👤 Usuários | Cadastro e gerenciamento de usuários |
| 🏪 Vendedores | Organização das informações dos vendedores |
| 🛍️ Produtos | Cadastro e gerenciamento de produtos |
| 🗂️ Categorias | Organização dos produtos por categoria |
| 🚚 Fornecedores | Registro e relacionamento com fornecedores |
| 🛒 Carrinho | Estrutura para armazenar itens de compra |
| 📦 Pedidos | Registro de pedidos e seus respectivos itens |
| 📊 Consultas e views | Verificação e apresentação dos dados |

---

## 🛠️ Tecnologias e ferramentas

- **MySQL:** sistema gerenciador de banco de dados.
- **MySQL Workbench:** ferramenta para executar e administrar comandos SQL.
- **SQL:** linguagem utilizada na definição, manipulação e consulta dos dados.
- **GitHub:** plataforma utilizada para versionamento e compartilhamento do projeto.

---

## 📁 Estrutura do projeto

```text
Banco-de-Dados-grupo09/
│
├── docs/                              Documentação das Etapas 1 e 2 e relatório de testes
│
├── sql/
│   ├── 01_ddl.sql
│   ├── 02_carga.sql
│   ├── 03_consultas.sql
│   ├── 04_indices_explain.sql
│   ├── 05_senhas_bcrypt.sql
│   ├── 06_auditoria.sql
│   ├── 07_transacoes_concorrencia.sql
│   └── 08_view_perfil.sql
│
├── testes/                            Códigos dos testes (banco, login, API e interface)
│
└── README.md
```

### 📄 Arquivos SQL

| Arquivo | Finalidade |
|---|---|
| `01_ddl.sql` | Criação do banco de dados e das tabelas (apaga e recria o `marketplace_db`). |
| `02_carga.sql` | Inserção dos dados iniciais. |
| `03_consultas.sql` | Consultas para verificar os dados cadastrados. |
| `04_indices_explain.sql` | Índice por nome de produto e comparação de `EXPLAIN` antes e depois (B4). |
| `05_senhas_bcrypt.sql` | Troca as senhas em texto claro da carga por hash BCrypt (executar depois do `02`). |
| `06_auditoria.sql` | Tabela de auditoria de produtos e duas triggers (B6). |
| `07_transacoes_concorrencia.sql` | Testes de `ROLLBACK`, `COMMIT` e bloqueio com duas conexões (B3). |
| `08_view_perfil.sql` | Views, perfis (roles) e usuários da aplicação. |

---

## 🚀 Como executar o projeto

### Pré-requisitos

Antes de começar, tenha instalado:

- [MySQL Server](https://dev.mysql.com/downloads/mysql/) 8.0.16 ou superior (o DDL usa `CHECK`)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)

### Passo a passo

**1. Clone o repositório**

```bash
git clone https://github.com/GuilhermeAlves147/Banco-de-Dados-grupo09.git
```

**2. Abra o MySQL Workbench**

Conecte-se à sua instância local do MySQL Server.

**3. Execute os scripts na ordem, um de cada vez**

| Ordem | Arquivo | Observação |
|---|---|---|
| 1 | `sql/01_ddl.sql` | Recria o banco: apaga qualquer dado anterior. |
| 2 | `sql/02_carga.sql` | Depende do `01`. |
| 3 | `sql/03_consultas.sql` | Apenas consulta. |
| 4 | `sql/04_indices_explain.sql` | Rodar uma vez; para repetir, veja o comentário no início do arquivo. |
| 5 | `sql/05_senhas_bcrypt.sql` | Depende do `02`. Necessário para o login do backend (BCrypt). |
| 6 | `sql/06_auditoria.sql` | Cria a tabela de auditoria e as triggers. |
| 7 | `sql/07_transacoes_concorrencia.sql` | A parte de concorrência usa duas conexões (veja os comentários no arquivo). |
| 8 | `sql/08_view_perfil.sql` | Antes de usar, troque as senhas `TROQUE_SENHA_...` dos usuários da aplicação. |

> **Importante:** execute os arquivos na ordem indicada e verifique se a conexão com o MySQL está funcionando antes de iniciar.

---

## 🧪 Testes

Os testes de software do projeto estão na pasta `testes/` e o relatório em `docs/`.

| Pasta | O que testa | Ferramenta |
|---|---|---|
| `testes/banco-junit` | DDL, carga e consultas SQL | JUnit 5 + JDBC |
| `testes/unitario-login` | Regra de login do backend | JUnit 5 + Mockito |
| `testes/api-postman` | 22 requisições da API | Postman |
| `testes/e2e-playwright` | Fluxos da interface | Playwright |

Cada pasta explica como executar em `testes/README.md`. Os testes de banco apagam e recriam o `marketplace_db`.

---

## 👥 Integrantes

| Integrante |
|---|
| Guilherme Alves de Paulo |
| Luís Felipe da Costa Maciel |
| Valter Junio Lopes Xavier |
| Ewerthon Klaiver Soares Marques |

---

## 🎓 Contexto acadêmico

**Disciplina:** Laboratório de Banco de Dados  
**Projeto:** Sistema de Marketplace — Grupo 09

---

<p align="center">
  Desenvolvido como parte do Projeto Final de Laboratório de Banco de Dados.
  <br>
  <strong>Grupo 09 • 2026</strong>
</p>
