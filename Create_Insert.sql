create table if not exists genres (
	id serial primary key,
	name_genre varchar(40) unique not null
);


create table if not exists artist (
	id serial primary key,
	name_artist varchar(40) unique not null
);

create table if not exists genres_artist (
	id serial primary key,
	genres_id integer not null references genres(id),
	artist_id integer not null references artist(id)
);

create table if not exists album (
	id serial primary key,
	number_album varchar(40) not null,
	year_album varchar(4) not null,	
	name_album varchar(40) not null
);

create table if not exists artist_album (
	id serial primary key,
	artist_id integer not null references artist(id),
	album_id integer not null references album(id)
);

create table if not exists tracks (
	id serial primary key,
	id_album integer references album(id) not null,
	name_tracks varchar(40) not null,
	time_tracks integer not null
);

create table if not exists collection_of_songs (
	id serial primary key,
	name_collection varchar(40) not null,
	year_collection integer not null
);

create table if not exists songs_in_the_collection (
	id serial primary key,
	collection_of_songs_id integer not null references collection_of_songs(id),
	tracks_id integer not null references tracks(id)
);

insert into artist(name_artist)
	values
	('Pink'),
	('The Prodigy'),
	('Linkin Park'),
	('Little Big'),
	('TLC'),
	('Клава Кока'),
	('MARUV'),
	('Tiesto');


insert into genres(name_genre)
	values
	('Поп'),
	('Рок'),
	('Техно'),
	('R&B'),
	('Рейв'),
	('House');
	
insert into genres_artist(genres_id, artist_id)
	values
	(1, 1),
	(1, 3),
	(1, 4),
	(1, 6),
	(1, 7),
	(2, 3),
	(3, 2),
	(4, 1),
	(4, 5),
	(5, 2),
	(5, 4),
	(6, 8);

insert into album(number_album, year_album, name_album)
	values
	(7, 2019, 'Beautiful Trauma'),
	(5, 2009, 'Invaders Must Die'),
	(2, 2003, 'Meteora'),
	(3, 2018, 'Antipositive,Pt.1'),
	(3, 1999, 'Fan Mail'),
	(2, 2019, 'Неприлино о личном'),
	(1, 2018, 'Black water'),
	(2, 2004, 'Just Be');
	
insert into artist_album(artist_id, album_id)
	values
	(1, 11),
	(2, 12),
	(3, 13),
	(4, 14),
	(5, 15),
	(6, 16),
	(7, 17),
	(8, 18);

insert into tracks(id_album, name_tracks, time_tracks)
	values
	(11, 'Beautiful Trauma', 270),
	(11, 'What About Us', 269),
	(12, 'Omen', 216),
	(12, 'Warrior’s Dance', 312),
	(13, 'Faint', 162),
	(13, 'Breaking the Habit', 196),
	(13, 'Numb', 188),
	(14, 'Faradenza', 149),
	(14, 'Lolly Bomb', 333),
	(15, 'No Scrubs', 214),
	(16, 'Влюблена в МДК', 187),
	(16, 'Мне пох', 158),
	(16, 'Зая', 161),
	(17, 'Drunk Groove', 226),
	(17, 'Black Water', 229),
	(17, 'Focus On Me', 175),
	(18, 'Traffic', 328);

insert into collection_of_songs(name_collection, year_collection)
	values
	('Сборник ПОП', '2022'),
	('Сборник Русских исполнителей', '2021'),
	('Сборник Зарубежных исполнителей', '2021'),
	('Сборник 2018', '2018'),
	('Сборник 2019', '2019'),
	('Сборник 2010', '2010'),
	('Сборник Рок и Рейв', '2019'),
	('Сборник Топ 15', '2022');
	
insert into songs_in_the_collection(collection_of_songs_id, tracks_id)
	values
	(1,	1),
	(1,	2),
	(1, 8),
	(1, 9),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(2, 8),
	(2, 9),
	(2, 11),
	(2, 12),
	(2, 13),
	(2, 14),
	(2, 15),
	(2, 16),
	(3, 1),
	(3, 2),
	(3, 3),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(3, 10),
	(3, 17),
	(4, 8),
	(4, 9),
	(4, 14),
	(4, 15),
	(4, 16),
	(5, 11),
	(5, 12),
	(5, 13),
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(6, 17),
	(7, 3),
	(7, 4),
	(7, 5),
	(7, 6),
	(7, 7),
	(8, 1),
	(8, 2),
	(8, 3),
	(8, 4),
	(8, 5),
	(8, 6),
	(8, 7);


	




