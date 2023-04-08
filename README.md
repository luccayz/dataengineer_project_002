# Data Engineer Project - Data Migration Cloud
Colocando alguns estudos em prática com um pequeno projeto de Engenharia de Dados.

# Diagrama Abstrato do Projeto

![Diagrama](https://user-images.githubusercontent.com/115668126/230206117-dcd0c3b1-aef6-4774-8efa-4f8a7da60df0.png)


### *Análise Geral*
- Encontrar uma fonte com muitos arquivos para projetos.
- Instalar um SGBD e criar uma base de dados.
- Ingestão de dados com apenas uma Query.
- Criar uma base de dados em ambiente Cloud e efetuar a migração de dados da máquina local para o ambiente Cloud.



***1º Etapa***

Obtenha alguns dados em formato .csv.

Utilizei o site Kaggle para obter o Dataset.
O Kaggle é uma plataforma online de ciência de dados que oferece uma comunidade global de cientistas de dados e aprendizado de máquina, bem como conjuntos de dados, competições, cursos e recursos para ajudar os profissionais a aprimorar suas habilidades em ciência de dados.

1.	Arquivo .csv baixado manualmente.
![FinalCSV](https://user-images.githubusercontent.com/115668126/230193787-1a2cd2f7-b501-4937-9e17-911c8b147b25.png)
- https://www.kaggle.com/datasets/ashishraut64/internet-users


***2º Etapa***

 Instale um SGBD no teu computador pessoal.
 
 1.	SGBD (Sistema Gerenciador de Banco de Dados) Instalado. 
Utilizei o SSMS (SQL Server Management Studio).

O SQL Server Management Studio é um software lançado pela primeira vez com o Microsoft SQL Server 2005 que é usado para configurar, gerenciar e administrar todos os componentes do Microsoft SQL Server.

![SSMS](https://user-images.githubusercontent.com/115668126/230194284-7622e7c6-0c1d-4a65-8e30-9acd1f9e5ee1.png)


***3º Etapa***

Crie uma base de dados no SGDB desejado.

1.	Query para criar a base de dados.

![QueryDBSSMS](https://user-images.githubusercontent.com/115668126/230194563-9d59b155-888b-4db1-8a5e-d6c78023c66a.png)


***4º Etapa***

Faça a ingestão dos dados do arquivo .csv para a base de dados utilizada sem utilizar Python.

Irei utilizar o BULK INSERT para ingestão dos dados na base de dados criada.
O BULK INSERT é um comando no SQL Server que permite a inserção de grandes volumes de dados em uma tabela de uma vez só. Ele é útil quando você precisa importar dados de arquivos de texto ou arquivos CSV para o SQL Server.
O mesmo pode ser executado em modo rápido ou em modo em lote. No modo rápido, o SQL Server tenta otimizar o processo de inserção para uma melhor performance. No modo em lote, o SQL Server usa um log de transações para controlar as inserções em massa.

Para executar o BULK INSERT, é preciso especificar o nome da tabela de destino e o caminho do arquivo de origem. Além disso, você pode especificar outras opções, como o tipo de arquivo de origem (por exemplo, CSV), o delimitador de campo, o caractere de terminação de linha e outras configurações.
Exemplo de uso do BULK INSERT para importar dados de um arquivo CSV:


BULK INSERT Tabela_exemplo


FROM 'C:\caminho\para\arquivo.csv'


WITH (


   FIELDTERMINATOR = ',',
   
   
   ROWTERMINATOR = '\n',
   
   
   FIRSTROW = 2
   
   
);



- ## ***Documentação Microsoft – BULK INSERT (Transact-SQL)***
- https://learn.microsoft.com/pt-br/sql/t-sql/statements/bulk-insert-transact-sql?view=sql-server-ver16

1.	Query para criação da tabela.
(Colunas criadas antecipadamente, pois, Bulk Insert não cria colunas ao inserir os dados na tabela.)

![QueryTBSSMS](https://user-images.githubusercontent.com/115668126/230194946-9bdfdd01-8106-4b4f-a2b8-47c160114b6a.png)

2.	Criação da Query para ingestão de dados do arquivo .csv utilizando o BULK INSERT.

![QueryBULKSSMS](https://user-images.githubusercontent.com/115668126/230195462-0212c2ad-06b1-4294-9736-96f6be448610.png)

3.	Query de criação da tabela executada.

![QueryTBExec](https://user-images.githubusercontent.com/115668126/230195625-2be6f265-342a-4af5-9a3c-e4a138238fbc.png)

4.	Conferindo a tabela.

![ConferindoTB](https://user-images.githubusercontent.com/115668126/230195704-c80147a2-4b04-4b4a-bf86-52fff3cea116.png)

***5º Etapa***

Crie uma base de dados no Azure SQL Database.

1.	Resource Group criado.

![RG](https://user-images.githubusercontent.com/115668126/230196413-cc66dfa0-7735-48b0-bf7d-d6557974d7e2.png)

2.	Servidor e Database criados.

![SVeDB](https://user-images.githubusercontent.com/115668126/230196774-1133299b-3b41-4238-8797-e66f58c431b4.png)

***6º Etapa***

Utilize alguma ferramenta para efetuar a migração dos dados que estão no SSMS do teu computador pessoal para o Azure Database.

1.	Ferramenta Azure Data Migration Assistant instalada.

O Azure Data Migration Assistant (DMA) é uma ferramenta gratuita da Microsoft que ajuda na migração de bancos de dados locais para o Azure. Ele permite a migração de várias fontes de dados, incluindo Microsoft SQL Server, Oracle e Sybase, para Azure SQL Database, Azure SQL Managed Instance e SQL Server em uma VM do Azure.

![DMA](https://user-images.githubusercontent.com/115668126/230197262-69dc3b23-4c3f-4f62-a824-546a11360414.png)

2.	Criando um novo projeto de migração no DMA.

![MigrationDMA](https://user-images.githubusercontent.com/115668126/230197380-7a1b099e-5b8f-483f-a1e2-61821fc8e7e2.png)

3.	Conectando com o servidor de origem para a migração de dados.

![SourceDMA](https://user-images.githubusercontent.com/115668126/230197527-c90f6097-64e1-4705-a454-f3234a86b88b.png)

4.	Conectando ao destino (Azure Database).

![SinkDMA](https://user-images.githubusercontent.com/115668126/230197602-f185d9c6-84d2-4aa7-b1b5-fa3735445b77.png)

5.	Selecionando a tabela para miração.

![TbDMA](https://user-images.githubusercontent.com/115668126/230197721-a25e6ee4-2776-44d4-af75-4372c83ce845.png)

6.	Script para criação da tabela gerado.

![ScriptDMA](https://user-images.githubusercontent.com/115668126/230197776-8b56d85c-0adf-4b45-bd64-82765b58ef6e.png)

7.	Deploy do Schema.

![image](https://user-images.githubusercontent.com/115668126/230200079-e7a96483-4787-4522-9988-9faa2d2e8d30.png)

8.	Migrando dados.

![DeployDadosDMA](https://user-images.githubusercontent.com/115668126/230197941-0cb54610-9b06-48af-8ccb-75410bcfbb2d.png)

8.1	Processo de migração concluída.

![MigrationExec](https://user-images.githubusercontent.com/115668126/230198023-87165f3a-085f-4162-8067-bd5ff4e25719.png)

9.	Conferindo migração pelo Query Editor no ambiente Azure.

![ConferindoQueryEditor](https://user-images.githubusercontent.com/115668126/230198098-64b4f45a-18d4-4e21-ba61-7f25dd188cef.png)


***Mini projeto feito para prática e estudo, toda dica será sempre bem vinda!***
