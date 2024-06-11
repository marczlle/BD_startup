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