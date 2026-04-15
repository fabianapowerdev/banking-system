# 🏦 Mini Plataforma Bancária

Projeto de uma **mini plataforma bancária**, desenvolvido em conjunto por **Fabiana Alves Chaves Ferreira** e **Savyo Arantes**, com foco em uma arquitetura moderna baseada em **serviços**, **eventos assíncronos** e **boas práticas de backend**.

A solução contempla o processamento de transações financeiras, mensageria, auditoria, análise de fraude e monitoramento.

---

## 📌 Visão Geral

A plataforma é composta por módulos desacoplados que se comunicam por meio de eventos, promovendo escalabilidade, rastreabilidade e organização da solução como um todo.

---

## 🧱 Arquitetura da Solução

### 🔹 Frontend
Responsável por consumir a API REST da plataforma e iniciar operações bancárias, como transações financeiras.

---

### 🔹 Serviço de Transações (Spring Boot)
Serviço principal da aplicação, responsável por:
- Expor endpoints REST
- Processar transações bancárias
- Persistir dados no banco de dados
- Publicar eventos de transação para a fila de mensagens

Tecnologias:
- Java  
- Spring Boot  
- Banco de Dados  

---

### 🔹 Fila de Mensagens (Kafka ou RabbitMQ)
Camada de mensageria utilizada para comunicação assíncrona entre os serviços, garantindo desacoplamento e resiliência da arquitetura.

---

### 🔹 Processamento Assíncrono
Responsável por consumir os eventos publicados na fila e encaminhá-los para os módulos apropriados, de forma independente do fluxo principal da aplicação.

---

### 🔹 Módulo de Análise e Fraude
Módulo responsável por:
- Avaliar transações com base em regras de negócio
- Identificar comportamentos suspeitos
- Gerar alertas de possível fraude

---

### 🔹 Serviço de Auditoria
Responsável por:
- Registrar eventos de transações
- Manter histórico de ações
- Garantir rastreabilidade e governança das operações

---

### 🔹 Painel de Monitoramento
Componente responsável por consolidar informações da plataforma, oferecendo:
- Dashboards
- Relatórios
- Visualização de logs e alertas

---

## 🔄 Fluxo de Funcionamento

1. O Frontend envia uma requisição para a API
2. O Serviço de Transações processa a solicitação e persiste os dados
3. Um evento de transação é publicado na fila de mensagens
4. O processamento assíncrono consome o evento
5. Os módulos de Análise e Fraude e Auditoria tratam o evento
6. As informações são disponibilizadas no Painel de Monitoramento

---

## 🛠️ Tecnologias Utilizadas

- Java
- Spring Boot
- REST API
- Mensageria (Kafka ou RabbitMQ)
- Banco de Dados
- Arquitetura orientada a eventos

---

## 🚧 Status do Projeto

Em desenvolvimento.

---

## 👥 Colaboradores

- Fabiana Alves Chaves Ferreira  
- Savyo Arantes  

---

## 📄 Observações

Este repositório concentra a implementação e evolução da mini plataforma bancária, incluindo decisões técnicas, organização dos serviços e integração entre os módulos.
