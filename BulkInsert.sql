BULK INSERT finals
FROM 'E:\Cursos\Projetos\Project_002\Files\Final.csv'
WITH (
	FIRSTROW = 2, --Pulando a primeira linha do cabe�alho.
	FORMAT = 'CSV' -- Formato do arquivo.
	);
GO