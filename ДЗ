--название и год выхода альбомов, вышедших в 2018 году
select year_album, name_album from album
	where year_album = '2018'

--название и продолжительность самого длительного трека;
select name_tracks, time_tracks from tracks
	where  time_tracks = (select max(time_tracks) from tracks)
	
--название треков, продолжительность которых не менее 3,5 минуты;
select name_tracks, time_tracks from tracks
	where time_tracks > '3:30' or time_tracks = '3:30'

--названия сборников, вышедших в период с 2018 по 2020 год включительно;
select name_collection from collection_of_songs
	where year_collection > '2017' and year_collection < '2021'

--исполнители, чье имя состоит из 1 слова;
select name_artist from artist
	where name_artist not like '% %'

--название треков, которые содержат буквы "tr".
select name_tracks  from tracks
	where name_tracks  like '%Tr%'