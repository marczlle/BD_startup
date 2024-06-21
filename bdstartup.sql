create database startup;
use startup;

CREATE TABLE membros(
membro_id int primary key not null,
nome VARCHAR(60),
cargo VARCHAR(45)
);

create table atividades(
atividades_id int primary key not null,
descricao varchar(150),
membro_id INT, foreign key (membro_id) references membros(membro_id)
);

insert into membros (membro_id, nome, cargo) VALUES (1, "Paulo", "Programador 1") ;
insert into atividades (atividades_id, descricao, membro_id) VALUES (1, "Criar a classe produto", 1);

select nome from membros;

select descricao from atividades;

SELECT membros.nome, atividades.descricao FROM membros INNER JOIN atividades ON membros.membro_id = atividades.atividades_id;

#teste
ALTER TABLE membros ADD genero_membro char(1);
UPDATE membros SET genero_membro = "M" WHERE membro_id = 1;
select * from membros;

ALTER TABLE atividades ADD data_inicio date;
UPDATE atividades SET data_inicio = "2024-06-18" WHERE atividades_id = 1;

ALTER TABLE atividades ADD data_finalizacao date;
UPDATE atividades SET data_finalizacao = "2024-06-19" WHERE atividades_id = 1;

#inserindo novos membros e atividades
insert into membros (membro_id, nome, cargo, genero_membro) VALUES (
(2, "João Silva", "Desenvolvedor Full Stack", "M"), 
(3, "Maria Santos", "Analista de banco de dados", "F"), 
(4, "Pedro Oliveira", "Engenheiro de Software", "M"),
(5, "Ana Costa", "Administrador de redes", "F"), 
(6, "Carlos Souza", "Especialista em segurança da informação", "M") 
);

insert into atividades (atividades_id, descricao, membro_id)  values(
(2, "Desenvolver novo módulo de login para o sistema.", 2, "2024-06-18","2024-06-19"),
(3, "Realizar manutenção preventiva nos servidores.", 4, "2024-06-18","2024-06-19"),
(4, "Criar documentação técnica do projeto XYZ.", 5, "2024-06-18","2024-06-19"),
(5, "Testar e validar integração com API externa.", 3, "2024-06-18","2024-06-19"),
(6, "Implementar melhorias na interface do usuário.", 6, "2024-06-18","2024-06-19")
);

update membros set cargo = " Administrador de Rede Sênior" where membro_id = 5;

#consulta
select * from membros;
select * from atividades;

SELECT membros.nome, membros.cargo, atividades.descricao, atividades.data_inicio, atividades.data_finalizacao FROM membros INNER JOIN atividades ON membros.membro_id = atividades.membro_id;

SELECT * FROM membros WHERE nome LIKE 'A%';
SELECT * FROM membros WHERE cargo LIKE 'E%';
SELECT nome, cargo FROM membros WHERE nome LIKE '%a' AND cargo LIKE 'd%';

select mem.nome, mem.cargo, atv.descricao from membros mem inner join atividades atv on mem.membro_id = atv.membro_id order by atv.descricao;
