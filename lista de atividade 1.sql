create database lojaCoisas;
use lojaCoisas;


create table estado (idEstado integer not null auto_increment, nome varchar(2), PRIMARY KEY(idEstado));

create table cidade (idCidade integer not null auto_increment, nome varchar(60), primary key (idCidade));

create table categoria (idCategoria integer not null auto_increment, nome varchar(40), primary key(idCategoria)); 

create table marca(idMarca integer not null auto_increment, nome varchar(40), primary key (idMarca));

create table produto (idProduto integer not null auto_increment, idCategoriaFK integer not null, idMarcaFK integer not null, nome varchar(80) null, preco float (10,2)null, primary key (idProduto), index produto_FKIndex1(idCategoriaFK), index produto_FKIndex2(idMarcaFK), foreign key (idCategoriaFk) references categoria (idCategoria), foreign key (idMarcaFK) references marca (idMarca));

create table vendedor (idVendedor integer not null auto_increment, nome varchar(60) null, email varchar(60) null, cpf varchar(15) null, idCidadeFK integer not null, idEstadoFK integer not null, primary key (idVendedor), index vendedor_FKIndex1(idCidadeFK), index vendedor_FKIndex2(idEstadoFK), foreign key (idCidadeFK) references cidade(idCidade), foreign key(idEstadoFK) references estado (idEstado));

create table cliente (idCliente integer not null auto_increment, nome varchar(60) null, email varchar(60) null, cpf varchar(15)null, data_nasc date null, idEstadoFK integer not null, idCidadeFK integer not null, primary key(idCliente), index Cliente_FKIndex1(idCidadeFK), index Cliente_FKIndex2(idEstadoFK), foreign key (idCidadeFK) references cidade (idCidade), foreign key(idEstadoFK) references estado(idEstado));

create table pedido(idPedido integer not null auto_increment, data_pedido date null, idVendedorFK integer not null, idClienteFK integer not null, primary key(idPedido), index pedido_FKIndex1(idVendedorFK), index pedido_FKIndex2(idClienteFK), foreign key(idVendedorFK) references vendedor (idVendedor), foreign key(idClienteFK) references Cliente (idCliente));

show tables;
	CREATE TABLE itens_pedido (
	idItens INTEGER NOT NULL AUTO_INCREMENT,
	idPedidoFK INTEGER NOT NULL,
	idProdutoFK INTEGER NOT NULL,
	qtde INTEGER NULL,
	valor_unit FLOAT(10,2) NULL,
	valor_total FLOAT(10,2) NULL,
	PRIMARY KEY(idItens),

	INDEX itens_pedido_FKIndex1(idProdutoFK),
	INDEX itens_pedido_FKIndex2(idPedidoFK),

	FOREIGN KEY(idProdutoFK)REFERENCES produto(idProduto),
	FOREIGN KEY(idPedidoFK) REFERENCES pedido(idPedido)
	);

/* Inserindo alguns Registros fictícios para as tabelas.

Segue scripts abaixo, depois das tabelas criadas, apenas copie e cole o conteúdo.

Tabela cidade
*/

INSERT INTO cidade VALUES (null,'São Paulo');
INSERT INTO cidade VALUES (null,'Campinas');
INSERT INTO cidade VALUES (null,'Poços de Caldas');
INSERT INTO cidade VALUES (null,'Andradas');
INSERT INTO cidade VALUES (null,'Rio de Janeiro');

/* Tabela estado */

INSERT INTO estado VALUES (null,'SP');
INSERT INTO estado VALUES (null,'MG');
INSERT INTO estado VALUES (null,'RJ');
INSERT INTO estado VALUES (null,'ES');
INSERT INTO estado VALUES (null,'MS');

/* Tabela Categoria */

INSERT INTO categoria VALUES (null,'Alimentos');
INSERT INTO categoria VALUES (null,'Eletrodomésticos');
INSERT INTO categoria VALUES (null,'Eletrônicos');
INSERT INTO categoria VALUES (null,'Limpeza');

/* Tabela Marca */

INSERT INTO marca VALUES (null,'Samsung');
INSERT INTO marca VALUES (null,'LG');
INSERT INTO marca VALUES (null,'Sony');
INSERT INTO marca VALUES (null,'Brastemp');
INSERT INTO marca VALUES (null,'Tio João');
INSERT INTO marca VALUES (null,'Come Tudo');
INSERT INTO marca VALUES (null,'Omo');
INSERT INTO marca VALUES (null,'Electrolux');
INSERT INTO marca VALUES (null,'BomBril');
INSERT INTO marca VALUES (null,'Camil');
INSERT INTO marca VALUES (null,'Fugini');

/* Tabela Vendedor */

INSERT INTO vendedor VALUES (null,'Fábio','fabio@gmail.com','358.256.259-95',1,1);
INSERT INTO vendedor VALUES (null,'João','joao@gmail.com','127.128.589.79',1,1);
INSERT INTO vendedor VALUES (null,'Henrique','henrique@gmail.com','852.123.145-13',2,1);
INSERT INTO vendedor VALUES (null,'Roberto','roberto@gmail.com','659.521.456.87',2,1);
INSERT INTO vendedor VALUES (null,'Marcos','marcos@outlook.com','589.654.851.25',3,2);
INSERT INTO vendedor VALUES (null,'Rafael','rafael@outlook.com','184.547.963.37',4,2);
INSERT INTO vendedor VALUES (null,'Marcelo','marcelo@outlook.com','332.653.421-15',5,3);

/* Tabela Cliente*/

INSERT INTO cliente VALUES (null,'Camila Fernandes','camilaf@gmail.com','222.258.658.99','1985-12-16',1,1);
INSERT INTO cliente VALUES (null,'João Rodrigues','rodrigues@hotmail.com','221.546.652.89','1990-01-25',1,2);
INSERT INTO cliente VALUES (null,'José Carlos','josec@hotmail.com','758.564.254.89','1991-03-15',2,3);
INSERT INTO cliente VALUES (null,'Fernando Henrique','fhenr@hotmail.com','555.666.888.99','1985-09-30',2,4);
INSERT INTO cliente VALUES (null,'Marina Ferreira','marinaf@outlook.com','451.578.965.21','1989-06-20',3,5);
INSERT INTO cliente VALUES (null,'Luis Paulo','luispaulo@outlook.com','216.052.358.69','1980-07-10',1,1);
INSERT INTO cliente VALUES (null,'Rui Biaco','ruibiaco@outlook.com','458.789.654.12','1983-03-30',1,2);
INSERT INTO cliente VALUES (null,'Claudemir Silva','claudemir@gmail.com','124.564.458.99','1985-11-25',3,2);
INSERT INTO cliente VALUES (null,'José da Silva','josesilva@outlook.com','025.658.458-89','1978-05-11',2,4);
INSERT INTO cliente VALUES (null,'Jonas Firmino','jonasf@outlook.com','335.658.963.55','1979-02-15',3,5);
INSERT INTO cliente VALUES (null,'Carolina Ferraz','carolferraz@outlook.com','124.254.458-12','1987-06-12',1,2);
INSERT INTO cliente VALUES (null,'Marcio Gomes','marciogomez@gmail.com','137.258.784-25','1991-01-30',3,5);

/* Tabela Produto */

INSERT INTO produto VALUES (null,1,5,'Arroz',11.50);
INSERT INTO produto VALUES (null,1,6,'Feijão',18.50);
INSERT INTO produto VALUES (null,1,11,'Molho de Tomate',1.50);
INSERT INTO produto VALUES (null,1,11,'Maionese',3.50);
INSERT INTO produto VALUES (null,1,11,'Ervilha',2.30);
INSERT INTO produto VALUES (null,1,10,'Arroz',9.90);
INSERT INTO produto VALUES (null,2,1,'Geladeira',3700.00);
INSERT INTO produto VALUES (null,2,1,'Microondas',450.00);
INSERT INTO produto VALUES (null,2,1,'Smart TV 48 4k',2700.00);
INSERT INTO produto VALUES (null,2,2,'Ar Condicionado 12.000 BTU',1350.00);
INSERT INTO produto VALUES (null,2,4,'Geladeira BRM58',2100.00);
INSERT INTO produto VALUES (null,2,4,'Máquina de Lavar 12KG',1430.00);
INSERT INTO produto VALUES (null,2,4,'Forno de Embutir 55 Litros',1260.00);
INSERT INTO produto VALUES (null,2,8,'Aspirador de Pó',350.00);
INSERT INTO produto VALUES (null,2,8,'Liquidificador',250.00);
INSERT INTO produto VALUES (null,2,8,'Batedeira',650.00);
INSERT INTO produto VALUES (null,3,1,'Samsung Galaxy S7',3550.00);
INSERT INTO produto VALUES (null,3,2,'Tablet LG 10.1',1550.00);
INSERT INTO produto VALUES (null,3,3,'Notebook Sony',3550.00);
INSERT INTO produto VALUES (null,4,9,'Pinho Brll',3.00);
INSERT INTO produto VALUES (null,4,9,'Lysoform 1 Lt',11.00);
INSERT INTO produto VALUES (null,4,9,'Limpol',8.00);
INSERT INTO produto VALUES (null,4,7,'Sabão em Pó',8.50);
INSERT INTO produto VALUES (null,4,7,'Sabão em Pó Líquido',9.50);

/* Tabela Pedido */

INSERT INTO pedido VALUES (null,'2016-08-08',1,1);
INSERT INTO pedido VALUES (null,'2016-08-07',2,1);
INSERT INTO pedido VALUES (null,'2016-07-31',2,4);
INSERT INTO pedido VALUES (null,'2016-08-08',3,5);
INSERT INTO pedido VALUES (null,'2016-07-09',4,8);
INSERT INTO pedido VALUES (null,'2016-08-04',7,10);
INSERT INTO pedido VALUES (null,'2016-08-03',6,11);
INSERT INTO pedido VALUES (null,'2016-08-02',7,8);
INSERT INTO pedido VALUES (null,'2016-08-05',6,9);
INSERT INTO pedido VALUES (null,'2016-07-28',2,5);
INSERT INTO pedido VALUES (null,'2016-07-29',1,10);

/* Tabela Itens Pedido */

INSERT INTO itens_pedido VALUES (null,1,1,5,11.50,57.50);
INSERT INTO itens_pedido VALUES (null,1,3,3,18.50,55.50);
INSERT INTO itens_pedido VALUES (null,1,21,10,3.00,30.00);
	INSERT INTO itens_pedido VALUES (null,1,24,4,9.50,38.00);

INSERT INTO itens_pedido VALUES (null,2,12,1,2100.00,2100.00);
INSERT INTO itens_pedido VALUES (null,2,17,1,650.00,650.00);

INSERT INTO itens_pedido VALUES (null,3,13,1,1430.00,1430.00);
INSERT INTO itens_pedido VALUES (null,3,14,1,1260.00,1260.00);

INSERT INTO itens_pedido VALUES (null,4,1,10,11.50,115.00);
INSERT INTO itens_pedido VALUES (null,4,7,10,9.90,99.00);
INSERT INTO itens_pedido VALUES (null,4,24,10,8.50,85.00);
INSERT INTO itens_pedido VALUES (null,4,22,2,11.00,22.00);

INSERT INTO itens_pedido VALUES (null,5,4,10,1.50,15.00);
INSERT INTO itens_pedido VALUES (null,5,5,4,3.50,14.00);
INSERT INTO itens_pedido VALUES (null,5,8,1,3700.00,3700.00);

INSERT INTO itens_pedido VALUES (null,6,4,5,1.50,7.50);
INSERT INTO itens_pedido VALUES (null,6,9,2,450.00,900.00);
INSERT INTO itens_pedido VALUES (null,6,10,1,2700.00,2700.00);
INSERT INTO itens_pedido VALUES (null,6,6,1,2.30,2.30);

INSERT INTO itens_pedido VALUES (null,7,11,1,1350.00,1350.00);
INSERT INTO itens_pedido VALUES (null,7,19,1,1550.00,1550.00);

INSERT INTO itens_pedido VALUES (null,8,15,1,350.00,350.00);
INSERT INTO itens_pedido VALUES (null,8,18,1,3550.00,3550.00);

INSERT INTO itens_pedido VALUES (null,9,1,10,11.50,115.00);
INSERT INTO itens_pedido VALUES (null,9,3,3,18.50,55.50);
INSERT INTO itens_pedido VALUES (null,9,21,5,3.00,15.00);
INSERT INTO itens_pedido VALUES (null,9,24,4,9.50,38.00);

INSERT INTO itens_pedido VALUES (null,10,15,1,350.00,350.00);
INSERT INTO itens_pedido VALUES (null,10,18,1,3550.00,3550.00);
INSERT INTO itens_pedido VALUES (null,10,4,5,1.50,7.50);
INSERT INTO itens_pedido VALUES (null,10,9,2,450.00,900.00);
INSERT INTO itens_pedido VALUES (null,10,10,1,2700.00,2700.00);
INSERT INTO itens_pedido VALUES (null,10,6,1,2.30,2.30);

/*1*/
select cliente.idCliente, cliente.nome, cliente.email, cidade.nome from cliente inner join cidade on cliente.idCidadeFK = cidade.idCidade;
/*2*/
select cliente.nome, cliente.email, estado.nome from cliente inner join estado on cliente.idEstadoFK = estado.idEstado and estado.idEstado = '1' ;
/*3*/
select cliente.nome, cliente.email, cidade.nome, estado.nome from cliente inner join estado on cliente.idEstadoFK = estado.idEstado inner join cidade on cliente.idCidadeFK = cidade.idCidade where cliente.nome like '%o%';
/*4*/
select produto.nome, produto.preco, marca.nome from produto inner join marca on produto.idMarcaFK = marca.idMarca where produto.preco between '1000' and '3000' ; 
/*5*/
select produto.nome, marca.nome, categoria.nome from produto inner join marca on produto.idMarcaFK = marca.idMarca inner join categoria on produto.idCategoriaFK = categoria.idCategoria where categoria.nome like '%e%' and marca.nome like '%e%'; 
/*6*/
select pedido.idPedido, cliente.nome, cliente.email, estado.nome, pedido.data_pedido from cliente inner join estado on cliente.idEstadoFK = estado.idEstado inner join pedido on pedido.idClienteFK = cliente.idCliente where pedido.data_pedido between '2016-08-1' and '2016-08-31' order by pedido.idPedido; 
/*7*/
select pedido.idPedido, pedido.data_pedido ,cliente.nome from cliente inner join estado on cliente.idEstadoFK = estado.idEstado inner join pedido on pedido.idClienteFK = cliente.idCliente inner join vendedor on pedido.idVendedorFK = vendedor.idVendedor  where pedido.data_pedido between '2016-07-01' and '2016-07-31' order by pedido.idPedido; 
/*8*/
select produto.nome, produto.preco, pedido.idPedido from itens_pedido inner join produto on itens_pedido.idProdutoFK = produto.idProduto inner join pedido on itens_pedido.idPedidoFK = pedido.idPedido where idPedido = '1';
/*9*/
/*10*/
select produto.preco, produto.nome, categoria.nome from produto inner join categoria on produto.idCategoriaFK = categoria.idCategoria inner join marca on produto.idMarcaFK = marca.idMarca order by produto.preco desc limit 0,1;
/*11*/
select pedido.idPedido, itens_pedido.valor_total, cliente.nome  from itens_pedido inner join pedido on itens_pedido.idPedidoFK = pedido.idPedido inner join cliente on pedido.idClienteFK = cliente.idCliente order by valor_total  desc limit 0,1 ;
/*12*/
select pedido.idPedido, itens_pedido.valor_total, vendedor.nome  from itens_pedido inner join pedido on itens_pedido.idPedidoFK = pedido.idPedido inner join vendedor on pedido.idVendedorFK = vendedor.idVendedor order by valor_total  asc limit 0,1 ;



 



select * from pedido;
select * from itens_pedido;
select * from produto;
select * from marca;
select * from categoria;
select * from vendedor;
select * from cliente;


select * from cidade;
select * from estado order by idEstado;



