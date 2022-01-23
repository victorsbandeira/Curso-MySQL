select nome, carga, ano from cursos
order by ano, nome;

select nome, carga, ano from cursos 
where ano between 2014 and 2019
order by ano asc, nome asc;

select * from cursos
where nome like 'ph%p_';

select * from gafanhotos
where nome like '%_silva%';

select * from cursos
where nome not like 'ph%p';

update cursos set nome = 'PáOO' where idcurso = 9;

select nome, min(totaulas) from cursos where ano = '2016';
select avg(totaulas) from cursos where ano = '2016';


/*Questões aula 12*/

select * from gafanhotos;
select nome from gafanhotos where sexo = 'F';
select nome from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';
select nome from gafanhotos where sexo ='M' and profissao = 'Programador';
select * from gafanhotos where sexo ='F' and nacionalidade = 'Brasil' and nome like 'J%';
select id,nome, nacionalidade from gafanhotos where sexo ='M' and nacionalidade not like 'Brasil' and nome like '%silva%' and peso < '100';
select max(altura) from gafanhotos where nacionalidade = 'Brasil' and sexo = 'M';
select avg(peso) from gafanhotos;
select min(peso) from gafanhotos where sexo = 'F' and nacionalidade not like 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';
select count(altura) from gafanhotos where sexo = 'F';


/*Aula 13*/

select * from cursos;
select count(distinct nacionalidade) from gafanhotos;
select distinct totaulas from cursos order by totaulas;
select totaulas, count(*) from cursos group by totaulas order by count(*);

select ano, count(*) from cursos 
group by ano
having ano > 2015 
order by count(*);

select ano, count(*) from cursos 
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos)
order by count(*);

/*Questão aula 13*/

/*1*/

select * from gafanhotos;
select profissao, count(*) from gafanhotos
group by profissao
order by count(*);

/*2*/
select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo
order by count(*);

/*3*/
select nacionalidade, count(*) from gafanhotos
where nacionalidade not like 'Brasil'
group by nacionalidade
having count(nacionalidade) > 3
order by nacionalidade;

/*4*/
select avg(altura) from gafanhotos;
select nome, count(*) from gafanhotos
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos)
order by nome;



/*Aula 15*/

desc gafanhotos;


alter table gafanhotos
add column cursospreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

alter table gafanhotos
change cursospreferido cursopreferido int;

update gafanhotos set cursopreferido = '6' where id = '1';

delete from cursos where idcurso = '28';

select * from gafanhotos;
select nome, ano from cursos;
select gafanhotos.nome, cursos.nome, cursos.ano from gafanhotos join cursos
on cursos.idcurso= gafanhotos.cursopreferido;

select g.nome, c.nome, c.ano from gafanhotos as g inner join cursos as c
on c.idcurso= g.cursopreferido 
order by g.nome;

select g.nome, c.nome, c.ano from gafanhotos as g right outer join cursos as c
on c.idcurso= g.cursopreferido;

/*Aula 16*/

create table gafanhoto_assiste_curso(
id int not null auto_increment,
data date,
idgafanhoto int,
idcurso int,
primary key (id),
foreign key (idgafanhoto) references gafanhotos (id),
foreign key (idcurso) references cursos (idcurso)

)default charset = utf8;

insert into gafanhoto_assiste_curso  values ( default, '2014-03-01','1','2');
select * from gafanhoto_assiste_curso;


select g.nome, c.nome from gafanhotos g join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
join cursos c 
on a.idcurso = c.idcurso;



