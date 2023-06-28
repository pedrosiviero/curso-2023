CREATE DATABASE INTEGRADOR;

use INTEGRADOR;

create table automovel (
	id_automovel INT PRIMARY KEY NOT NULL,
	marca VARCHAR(50) NOT NULL,
	modelo VARCHAR(50) NOT NULL,
	ano VARCHAR(50) NOT NULL,
	cor VARCHAR(50) NOT NULL,
	placa VARCHAR(50) NOT NULL
);

create table endereco (
	id_endereco INT PRIMARY KEY NOT NULL,
	cep VARCHAR(50) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero VARCHAR(50) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	estado VARCHAR(50) NOT NULL,
	complemento VARCHAR(50) NOT NULL
);


create table categoria_produto (
	id_categoria INT PRIMARY KEY NOT NULL,
	categoria TEXT NOT NULL
);

create table nivel_de_acesso (
	nivel_de_acesso INT PRIMARY KEY NOT NULL,
	nome_nivel VARCHAR(50) NOT NULL
);

create table usuario (
	id_usuario INT PRIMARY KEY NOT NULL,
	id_endereco INT NOT NULL,
	nivel_de_acesso INT NOT NULL,
	cpf VARCHAR(50) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	data_nsc DATE NOT NULL,
	celular VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(50) NOT NULL
);
alter table usuario add constraint fk_usuario_endereco foreign key (id_endereco) references endereco (id_endereco);
alter table usuario add constraint fk_usuario_acesso foreign key (nivel_de_acesso) references nivel_de_acesso (nivel_de_acesso);

create table pagamento (
	id_pagamento INT PRIMARY KEY NOT NULL,
	id_vendedor INT NOT NULL,
	id_comprador INT NOT NULL,
	codigo_rastreio INT NOT NULL,
	produto_recebido VARCHAR(50) NOT NULL,
	pagamento_concluida VARCHAR(50) NOT NULL
);
alter table pagamento add constraint fk_pagamento_vendedor foreign key (id_vendedor) references usuario (id_usuario);
alter table pagamento add constraint fk_pagamento_comprador foreign key (id_comprador) references usuario (id_usuario);



create table promocao (
	id_promocao INT PRIMARY KEY,
	nome_promocao VARCHAR(50),
	porcentagem_promocao INT
);

create table fotos (
    id_fotos INT PRIMARY KEY NOT NULL,
    foto_1 VARCHAR(50) NOT NULL ,
    foto_2 VARCHAR(50),
    foto_3 VARCHAR(50),
    foto_4 VARCHAR(50),
    foto_5 VARCHAR(50)
);

create table entregador (
	id_entregador INT PRIMARY KEY NOT NULL,
	nivel_de_acesso INT NOT NULL,
	id_automovel INT NOT NULL,
    class_media DECIMAL(3,2) NOT NULL,
    qtd_entregas INT NOT NULL
);
alter table entregador add constraint fk_entregador_usuario foreign key (id_entregador) references usuario (id_usuario);
alter table entregador add constraint fk_entregador_acesso foreign key (nivel_de_acesso) references nivel_de_acesso (nivel_de_acesso);
alter table entregador add constraint fk_entregador_automovel foreign key (id_automovel) references automovel (id_automovel);

create table produto (
	id_produto INT PRIMARY KEY NOT NULL,
	id_vendedor INT NOT NULL,
	id_categoria INT NOT NULL,
	id_promocao INT,
    id_fotos INT NOT NULL,
	preco DECIMAL(5,2) NOT NULL,
	nome_produto VARCHAR(50) NOT NULL,
	descricao VARCHAR(50) NOT NULL,
	quantidade INT NOT NULL
);
alter table produto add constraint fk_produto_usuario foreign key (id_vendedor) references usuario (id_usuario);
alter table produto add constraint fk_produto_categoria foreign key (id_categoria) references categoria_produto (id_categoria);
alter table produto add constraint fk_produto_promocao foreign key (id_promocao) references promocao (id_promocao);
alter table produto add constraint fk_produto_fotos foreign key (id_fotos) references fotos (id_fotos);


create table venda (
	codigo_rastreio INT PRIMARY KEY NOT NULL,
	id_vendedor INT NOT NULL,
	id_comprador INT NOT NULL,
	id_produto INT NOT NULL,
	id_pagamento INT NOT NULL,
	id_entregador INT,
	preco_corrida DECIMAL(4,2),
	venda_concluida BOOLEAN NOT NULL
);
alter table venda add constraint fk_venda_vendedor foreign key (id_vendedor) references usuario (id_usuario);
alter table venda add constraint fk_venda_comprador foreign key (id_comprador) references usuario (id_usuario);
alter table venda add constraint fk_venda_produto foreign key (id_produto) references produto (id_produto);
alter table venda add constraint fk_venda_pagamento foreign key (id_pagamento) references pagamento (id_pagamento);

insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (1, '85660000', 'Derek', '2', 'Bairro Los Angeles', 'Saint Louis', 'California', 'Profit-focused demand-driven matrices');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (2, '85660000', 'Erie', '6455', 'Bairro Sioux Falls', 'Macon', 'South Dakota', 'Programmable secondary interface');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (3, '85660000', 'Jenna', '80', 'Bairro El Paso', 'Paterson', 'Texas', 'Exclusive optimizing forecast');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (4, '85660000', 'Heath', '8', 'Bairro Boulder', 'Seattle', 'Colorado', 'Streamlined exuding knowledge user');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (5, '85660000', 'Coleman', '74', 'Bairro Duluth', 'Reno', 'Minnesota', 'Pre-emptive composite process improvement');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (6, '85660000', 'Almo', '457', 'Bairro Bradenton', 'Miami', 'Florida', 'Distributed heuristic definition');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (7, '85660000', 'Starling', '4', 'Bairro Los Angeles', 'Miami', 'California', 'Down-sized asynchronous firmware');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (8, '85660000', 'Mockingbird', '8', 'Bairro Oklahoma City', 'Greenville', 'Oklahoma', 'Devolved asymmetric interface');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (9, '85660000', 'Oriole', '7843', 'Bairro Lawrenceville', 'Allentown', 'Georgia', 'Business-focused optimal policy');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (10, '85660000', 'Cody', '095', 'Bairro Port Charlotte', 'Seattle', 'Florida', 'Persistent context-sensitive archive');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (11, '85660000', 'Mariner', '873', 'Bairro Birmingham', 'Duluth', 'Alabama', 'Psophia viridis');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (12, '85660000', 'Erie', '541', 'Bairro Philadelphia', 'Virginia Beach', 'Pennsylvania', 'Mazama gouazoubira');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (13, '85660000', 'Canary', '69', 'Bairro Jamaica', 'Birmingham', 'New York', 'Papio cynocephalus');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (14, '85660000', 'Tony', '1351', 'Bairro Lexington', 'Modesto', 'Kentucky', 'Ara chloroptera');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (15, '85660000', 'Grayhawk', '11', 'Bairro Los Angeles', 'Jackson', 'California', 'Oreotragus oreotragus');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (16, '85660000', 'Miller', '99', 'Bairro Louisville', 'Arlington', 'Kentucky', 'Heloderma horridum');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (17, '85660000', 'Loomis', '1119', 'Bairro Saint Petersburg', 'Elizabeth', 'Florida', 'Zenaida asiatica');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (18, '85660000', 'American Ash', '564', 'Bairro Raleigh', 'Houston', 'North Carolina', 'Microcavia australis');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (19, '85660000', 'Fairview', '77', 'Bairro Ashburn', 'New York City', 'Virginia', 'Plocepasser mahali');
insert into endereco (id_endereco, cep, rua, numero, bairro, cidade, estado, complemento) values (20, '85660000', 'Victoria', '5', 'Bairro Saint Louis', 'Lincoln', 'Missouri', 'Lorythaixoides concolor');

insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (6, 'Kia', 'Rio', 2002, 'Puce', '3N1AB6AP3CL810357');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (7, 'Chevrolet', 'Sportvan G30', 1996, 'Khaki', 'SALFR2BG4EH567867');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (8, 'Pontiac', 'Parisienne', 1984, 'Red', '1C4NJPBA2FD818185');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (9, 'Acura', 'NSX', 2000, 'Aquamarine', 'WUAUUAFGXCN964180');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (10, 'Ford', 'F250', 1984, 'Turquoise', 'WVWED7AJ6DW225214');

insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (1, 'Honda', 'Odyssey', 2010, 'Pink', 'WDDGF4HB3DG488924');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (2, 'Ford', 'Laser', 1989, 'Maroon', 'KMHEC4A49DA056164');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (3, 'Mercedes-Benz', 'S-Class', 1986, 'Fuscia', 'WBAFR9C59CD468010');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (4, 'Volkswagen', 'rio', 1996, 'Aquamarine', 'WBAEW53453P145835');
insert into automovel (id_automovel, marca, modelo, ano, cor, placa) values (5, 'Mercedes-Benz', 'S-Class', 1996, 'Yellow', '5N1AT2MK7FC754499');

insert into categoria_produto (id_categoria, categoria) values (1, 'Album');
insert into categoria_produto (id_categoria, categoria) values (2, 'habitasse platea');
insert into categoria_produto (id_categoria, categoria) values (3, 'nulla');
insert into categoria_produto (id_categoria, categoria) values (4, 'in');
insert into categoria_produto (id_categoria, categoria) values (5, 'integer non');

insert into nivel_de_acesso (nivel_de_acesso, nome_nivel) values(1, 'usuario');
insert into nivel_de_acesso (nivel_de_acesso, nome_nivel) values(2, 'entregador');


insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (1, 1, 1, '+86 655 250 2411', 'Josselyn Kippen', '1969-08-31', '(934) 9643228', 'jkippen0@rambler.ru', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (2, 2, 1, '84007102217', 'Lee Meharry', '1966-10-29', '(376) 8576533', 'lmeharry1@rediff.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (3, 3, 2, '18299441617', 'Indira Nicolson', '1962-09-17', '(847) 1002856', 'inicolson2@vkontakte.ru', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (4, 4, 2, '42021498536', 'Keen Goby', '2005-06-21', '(216) 4155303', 'kgoby3@addtoany.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (5, 5, 1, '86784426669', 'Euell Depport', '1964-04-17', '(260) 2811595', 'edepport4@wordpress.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (6, 6, 1, '51649169465', 'Neale Jeynes', '1985-01-03', '(462) 6067735', 'njeynes5@dot.gov', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (7, 7, 2, '46781869402', 'Richmound Bischof', '1975-10-11', '(371) 4344690', 'rde6@sfgate.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (8, 8, 1, '67389311042', 'Natale Ruusa', '1979-10-08', '(160) 9758323', 'nruusa7@cnbc.com', '1234', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (9, 9, 2, '24940237170', 'Rodina Berndtssen', '1984-04-11', '(758) 2521447', 'rberndtssen8@timesonline.co.uk', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (10, 10, 2, '63888206040', 'Bobbee Marti', '1966-12-18', '(488) 8451992', 'bmarti9@admin.ch', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (11, 11, 2, '48976747588', 'Christabella Naire', '1967-08-01', '(266) 9146914', 'cnairea@chronoengine.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (12, 12, 1, '63658574751', 'Menard Hosby', '1966-09-03', '(913) 9161832', 'mhosbyb@godaddy.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (13, 13, 2, '17358398310', 'Roderic Farryan', '1974-12-26', '(324) 2585910', 'rfarryanc@typepad.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (14, 14, 1, '21162727168', 'Jenna Jedryka', '1961-11-07', '(933) 8011243', 'jjedrykad@chicagotribune.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (15, 15, 1, '25736581022', 'Martita Faint', '1992-05-01', '(709) 1181157', 'mfainte@flavors.me', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (16, 16, 2, '38091155346', 'Paddie Audenis', '1978-09-08', '(769) 6148849', 'paudenisf@unblog.fr', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (17, 17, 1, '78873021139', 'Jacintha O''Growgane', '1965-01-12', '(445) 7803326', 'jogrowganeg@paginegialle.it', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (18, 18, 2, '86079445122', 'Bonny Grishankov', '2002-05-14', '(595) 9812038', 'bgrishankovh@unesco.org', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (19, 19, 1, '41407575178', 'Jeremiah Seakings', '1997-07-26', '(991) 4096261', 'jseakingsi@ycombinator.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (20, 20, 2, '86891985119', 'Zorah Garfirth', '1991-04-05', '(574) 8729303', 'zgarfirthj@canalblog.com', '1234');
insert into usuario (id_usuario, id_endereco, nivel_de_acesso, cpf, nome, data_nsc, celular, email, senha) values (21, null, 1, '86891985100', 'Eduardo Paggi', '2006-04-09', '(674) 8239303', 'eduardopaggi@outlook.com', '1234');



insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (1, 1, 2, true, true, 1);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (2, 2, 5, true, true, 2);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (3, 5, 12, true, true, 3);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (4, 6, 14, true, true, 4);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (5, 8, 19, true, true, 5);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (6, 12, 1, true, true, 6);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (7, 14, 17, true, true, 7);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (8, 15, 5, true, true, 8);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (9, 17, 6, true, true, 9);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (10, 19, 8, true, true, 10);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (11, 1, 8, true, true, 11);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (12, 2, 12, true, true, 12);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (13, 5, 15, true, true, 13);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (14, 6, 14, true, true, 14);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (15, 8, 17, true, true, 15);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (16, 12, 19, true, true, 16);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (17, 14, 17, true, true, 17);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (18, 15, 12, true, true, 18);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (19, 17, 8, true, true, 19);
insert into pagamento (id_pagamento, id_vendedor, id_comprador, produto_recebido, pagamento_concluida, codigo_rastreio) values (20, 20, 6, true, true, 20);

insert into promocao (id_promocao, nome_promocao, porcentagem_promocao) values (1, 'Wisozk, Von and Stokes', 45);
insert into promocao (id_promocao, nome_promocao, porcentagem_promocao) values (2, 'Beahan and Sons', 22);
insert into promocao (id_promocao, nome_promocao, porcentagem_promocao) values (3, 'Connelly LLC', 29);
insert into promocao (id_promocao, nome_promocao, porcentagem_promocao) values (4, 'Bechtelar-Greenholt', 41);
insert into promocao (id_promocao, nome_promocao, porcentagem_promocao) values (5, 'Bergstrom, Wehner and Murray', 17);

insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (3, 2, 1, 4.54, 1259);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (4, 2, 2, 4.96, 56);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (7, 2, 3, 3.50, 412);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (9, 2, 4, 4.07, 659);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (10, 2, 5, 4.17, 5801);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (11, 2, 6, 4.21, 2173);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (13, 2, 7, 3.73, 393);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (16, 2, 8, 4.9, 766);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (18, 2, 9, 3.86, 3713);
insert into entregador (id_entregador, nivel_de_acesso, id_automovel, class_media, qtd_entregas) values (20, 2, 10, 4.18, 2395);

insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (1, 'Open-architected multi-tasking adapter', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (2, 'Universal 5th generation budgetary management', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (3, 'Cross-platform human-resource installation', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (4, 'Face to face attitude-oriented emulation', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (5, 'Function-based disintermediate hardware', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (6, 'Reactive system-worthy Graphical User Interface', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (7, 'Networked next generation project', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (8, 'Realigned eco-centric Graphical User Interface', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (9, 'Optimized 24 hour knowledge base', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (10, 'Enhanced actuating time-frame', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (11, 'Sharable web-enabled matrices', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (12, 'Innovative system-worthy open architecture', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (13, 'Universal logistical circuit', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (14, 'Reverse-engineered 3rd generation array', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (15, 'Open-source even-keeled initiative', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (16, 'Secured 5th generation secured line', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (17, 'Open-source reciprocal monitoring', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (18, 'Proactive encompassing data-warehouse', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (19, 'Networked intermediate moratorium', null, null, null, null);
insert into fotos (id_fotos, foto_1, foto_2, foto_3, foto_4, foto_5) values (20, 'Extended clear-thinking project', null, null, null, null);

insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (1, 1, 1, null, 1, 162.29, 'Juice - Lemon', 'critical toolset', 4);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (2, 2, 2, null, 2, 17.53, 'Urban Zen Drinks', 'open architecture', 5);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (3, 5, 3, null, 3, 224.76, 'Green Scrubbie Pad H.duty', 'intangible productivity', 10);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (4, 6, 4, null, 4, 88.15, 'Wine - Ej Gallo Sierra Valley', 'internet solution', 2);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (5, 8, 5, null, 5, 10.11, 'Container - Foam Dixie 12 Oz', 'dedicated orchestration', 6);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (6, 12, 1, null, 6, 100.62, 'Absolut Citron', 'disintermediate infrastructure', 4);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (7, 14, 2, null, 7, 169.29, 'Pork - Suckling Pig', 'thinking circuit', 7);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (8, 15, 3, null, 8, 146.86, 'Chocolate Bar - Coffee Crisp', 'coherent concept', 2);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (9, 17, 4, null, 9, 88.42, 'Pork - Ham Hocks - Smoked', 'homogeneous moderator', 1);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (10, 19, 5, null, 10, 57.01, 'Sprouts - Baby Pea Tendrils', 'server database', 1);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (11, 1, 1, null, 11, 193.75, 'Wine - German Riesling', 'pricing structure', 6);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (12, 2, 2, null, 12, 154.95, 'Munchies Honey Sweet Trail Mix', 'asynchronous archive', 3);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (13, 5, 3, null, 13, 15.55, 'Wine - Niagara,vqa Reisling', 'data-warehouse', 3);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (14, 6, 4, null, 14, 95.29, 'Beer - Camerons Auburn', 'enabled emulation', 7);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (15, 8, 5, null, 15, 67.7, 'Soup - Beef, Base Mix', 'empowering hardware', 10);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (16, 12, 1, null, 16, 134.33, 'Cookies - Assorted', 'based emulation', 5);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (17, 14, 2, null, 17, 222.5, 'Lid Tray - 16in Dome', 'oriented project', 9);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (18, 15, 3, null, 18, 98.18, 'Fruit Mix - Light', 'impactful portal', 10);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (19, 17, 4, null, 19, 164.25, 'Ezy Change Mophandle', 'User Interface', 3);
insert into produto (id_produto, id_vendedor, id_categoria, id_promocao, id_fotos, preco, nome_produto, descricao, quantidade) values (20, 19, 1, null, 20, 205.83, 'Fleetwood Mac Album', 'Álbum da Banda Fleetwood Mac', 1);

insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (1, 1, 2, 1, 1, 1, 24.6, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (2, 2, 5, 2, 2, 2, 16.11, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (3, 5, 12, 3, 3, 3, 7.55, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (4, 6, 14, 4, 4, 4, 12.76, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (5, 8, 19, 5, 5, 5, 16.3, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (6, 12, 1, 6, 6, 6, 16.9, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (7, 14, 17, 7, 7, 7, 36.14, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (8, 15, 5, 8, 8, 8, 27.89, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (9, 17, 6, 9, 9, 9, 29.07, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (10, 19, 8, 10, 10, 10, 30.85, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (11, 1, 8, 11, 11, 1, 26.67, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (12, 2, 12, 12, 12, 2, 18.75, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (13, 5, 15, 13, 13, 3, 10.07, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (14, 6, 14, 14, 14, 4, 13.44, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (15, 8, 17, 15, 15, 5, 8.56, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (16, 12, 19, 16, 16, 6, 28.72, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (17, 14, 17, 17, 17, 7, 35.02, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (18, 15, 12, 18, 18, 8, 7.88, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (19, 17, 8, 19, 19, 9, 8.53, true);
insert into venda (codigo_rastreio, id_vendedor, id_comprador, id_produto, id_pagamento, id_entregador, preco_corrida, venda_concluida) values (20, 19, 6, 20, 20, 10, 12.47, true);
