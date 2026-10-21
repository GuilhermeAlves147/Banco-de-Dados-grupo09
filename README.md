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
├── docs/
│   └── Documentação do projeto
│
├── sql/
│   ├── 01_ddl market.sql
│   ├── 02_carga.sql
│   ├── 03_consultas.sql
│   └── 04_05_view_perfil.sql
│
└── README.md
```

> A estrutura acima representa a organização descrita neste README. Os nomes e caminhos devem corresponder aos arquivos existentes no repositório.

### 📄 Arquivos SQL

| Arquivo | Finalidade |
|---|---|
| `01_ddl market.sql` | Criação do banco de dados e das tabelas. |
| `02_carga.sql` | Inserção dos dados iniciais. |
| `03_consultas.sql` | Consultas para verificar os dados cadastrados. |
| `04_05_view_perfil.sql` | Definição de views e configurações de perfis. |

---

## 🚀 Como executar o projeto

### Pré-requisitos

Antes de começar, tenha instalado:

- [MySQL Server](https://dev.mysql.com/downloads/mysql/)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)

### Passo a passo

**1. Clone o repositório**

```bash
git clone https://github.com/GuilhermeAlves147/Banco-de-Dados-grupo09.git
```

**2. Abra o MySQL Workbench**

Conecte-se à sua instância local do MySQL Server.

**3. Crie a estrutura do banco**

Abra e execute o arquivo:

```text
sql/01_ddl market.sql
```

**4. Insira os dados**

Após a criação das tabelas, execute:

```text
sql/02_carga.sql
```

**5. Execute as consultas**

Para verificar os registros e os resultados, execute:

```text
sql/03_consultas.sql
```

**6. Configure as views e os perfis**

Por último, abra e execute:

```text
sql/04_05_view_perfil.sql
```

> **Importante:** execute os arquivos na ordem indicada e verifique se a conexão com o MySQL está funcionando antes de iniciar.

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
