# Pipeline de Dados de E-commerce com Oracle SQL

## Visão Geral do Projeto

Este projeto simula a construção de um **pipeline de dados para um sistema de e-commerce** utilizando o dataset público da Olist.

O objetivo é demonstrar habilidades em:

- modelagem de dados relacional
- processos de ETL (Extract, Transform, Load)
- consultas analíticas em SQL
- organização de um pipeline de dados

O projeto foi desenvolvido utilizando **Oracle SQL Developer**, com foco na construção de um **projeto de portfólio para Análise de Dados e Engenharia de Dados**.

---

# Dataset Utilizado

O dataset utilizado neste projeto é o:

**Brazilian E-Commerce Public Dataset by Olist**

Ele contém informações sobre:

- clientes
- pedidos
- itens de pedidos
- produtos
- categorias de produtos

Arquivos utilizados:

- `olist_customers_dataset.csv`
- `olist_orders_dataset.csv`
- `olist_order_items_dataset.csv`
- `olist_products_dataset.csv`
- `product_category_name_translation.csv`

---

# Arquitetura do Pipeline de Dados

O projeto segue uma arquitetura simples dividida em **três camadas**.

## Camada de Staging

Os arquivos CSV são carregados inicialmente em **tabelas de staging**, que armazenam os dados brutos do dataset.

Exemplos de tabelas:

- `STG_CUSTOMERS`
- `STG_ORDERS`
- `STG_ORDER_ITEMS`
- `STG_PRODUCTS`
- `STG_CATEGORY_TRANSLATION`

Essa camada preserva os dados originais antes das transformações.

---

## Camada de Modelo Relacional

Após a ingestão dos dados, foi criado um **modelo relacional normalizado** para organizar as informações do e-commerce.

### Tabelas Dimensionais

- `T_CLIENTE`
- `T_PRODUTO`
- `T_SUBCATEGORIA`
- `T_CATEGORIA`

### Tabelas Transacionais

- `T_PEDIDO`
- `T_ITEM_PEDIDO`

Fluxo de relacionamento entre as tabelas:

```
CLIENTE
   ↓
PEDIDO
   ↓
ITEM_PEDIDO
   ↓
PRODUTO
   ↓
SUBCATEGORIA
   ↓
CATEGORIA
```

Todas as tabelas possuem:

- Primary Keys
- Foreign Keys
- Sequences para geração de identificadores

---

# Processo de ETL

O processo de ETL foi implementado utilizando **scripts SQL no Oracle**.

Principais técnicas utilizadas:

- `INSERT INTO ... SELECT`
- `JOIN`
- `DISTINCT`
- tratamento de valores `NULL` com `NVL`
- uso de `SEQUENCES` para geração de chaves

Fluxo de transformação dos dados:

```
STG_PRODUCTS → T_CATEGORIA
STG_PRODUCTS → T_SUBCATEGORIA
STG_PRODUCTS → T_PRODUTO

STG_CUSTOMERS → T_CLIENTE

STG_ORDERS → T_PEDIDO

STG_ORDER_ITEMS → T_ITEM_PEDIDO
```

---

# Análises Realizadas

Foram desenvolvidas consultas analíticas para gerar insights de negócio.

Principais análises:

- Receita total por categoria de produto
- Top 10 produtos com maior faturamento
- Distribuição de vendas por estado
- Ticket médio por pedido
- Clientes que mais compraram
- Receita mensal da plataforma

Essas consultas simulam análises comuns em ambientes de **Business Intelligence e análise de dados em e-commerce**.

---

# Estrutura do Projeto

```
ecommerce-data-pipeline-oracle-sql
│
├── data
│   ├── olist_customers_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_items_dataset.csv
│   ├── olist_products_dataset.csv
│   └── product_category_name_translation.csv
│
├── sql
│   ├── Create.sql
│   ├── Drop.sql
│   ├── Insert.sql
│   ├── Queries.sql
│   └── Select.sql
│
├── diagrams
│   └── data_model.png
│
└── README.md
```

---

# Tecnologias Utilizadas

- Oracle SQL Developer
- SQL
- Modelagem de dados relacional
- Dataset público (Kaggle)

---

# Objetivo do Projeto

Este projeto foi desenvolvido com o objetivo de demonstrar habilidades em:

- modelagem de banco de dados
- desenvolvimento de pipelines de dados
- transformação de dados (ETL)
- análise de dados com SQL
- organização de projetos de dados para portfólio

---