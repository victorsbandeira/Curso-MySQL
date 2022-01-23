alter table pessoas
add column profissao varchar(20) not null default '' after nascimento;

alter table pessoas
change column prof profissao varchar(20) not null default '';

alter table pessoas
rename to Clientes;



create table if not exists cursos (
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year default '2021'
)default charset=utf8;

alter table cursos
add idcursos int first;

alter table cursos
add primary key (idcursos);

alter table cursos
modify idcursos int auto_increment;

insert into cursos values
(default, 'HTML4','Curso de HTML5','40','37','2014'),
(default, 'Algoritmos','Logica de programação','20','15','2014'),
(default, 'Photoshop','Dicas de Photoshop','10','8','2015'),
(default, 'PGP','PHP para iniciantes','40','20','2015'),
(default, 'Jarva','Introdução Java','10','29','2015'),
(default, 'MySQL','Banco de dados MYSQL','30','15','2015'),
(default, 'Word','Word Office','40','30','2016'),
(default, 'Sapateado','Danças','40','30','2018'),
(default, 'Cozinha','Culinaria','40','37','2019'),
(default, 'Youtuber','Como ser Blogueiro','20','18','2021');

select * from clientes;

desc cursos;

update cursos
set nome ='PHP', ano = '2016'
where idcursos = '4';

update cursos
set carga='40'
where idcursos = '5';

delete from cursos
where idcursos between '9' and '10';
