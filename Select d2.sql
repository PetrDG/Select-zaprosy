--1. ���������� ������������ � ������ �����;
select genres_id, count(artist_id) from genres_artist
	group by genres_id

--2. ���������� ������, �������� � ������� 2019-2020 �����;
select year_album,  count(name_tracks) from tracks t 
	right join album a on t.id_album = a.id
	group by year_album
	having year_album > '2018' and year_album < '2021'
	
--3. ������� ����������������� ������ �� ������� �������;
select name_album, concat(floor(avg(time_tracks)/60),':',(floor(avg(time_tracks)-((floor(avg(time_tracks)/60))*60)))) from album a 
	inner join tracks t on a.id = t.id_album
	group by name_album


--4. ��� �����������, ������� �� ��������� ������� � 2020 ����;
select distinct name_artist from artist a
	where name_artist not in (
		select distinct name_artist from artist
		right join artist_album aa on a.id = aa.artist_id
		right join album a2 on a2.id = aa.album_id
		where year_album = '2020'
		)
order by name_artist

--5. �������� ���������, � ������� ������������ ���������� ����������� (�������� ���� "Pink");
select name_collection from collection_of_songs cos2 
	right join songs_in_the_collection sitc on sitc.collection_of_songs_id = cos2.id 
	right join tracks t on t.id = sitc.tracks_id
	right join album a on a.id = t.id_album 
	right join artist_album aa  on aa.album_id = t.id_album 
	right join artist a2 on a2.id = aa.artist_id 
	where name_artist like 'Pink'
order by name_collection

--6. �������� ��������, � ������� ������������ ����������� ����� 1 �����;
select name_album from album a 
	right join artist_album aa  on aa.album_id = a.id
	right join artist a2 on a2.id = aa.artist_id 
	right join genres_artist ga on ga.artist_id = a2.id 
	group by name_album
		having count(genres_id) > 1

--7. ������������ ������, ������� �� ������ � ��������;
select name_tracks from tracks t 
	right join songs_in_the_collection sitc on sitc.tracks_id = t.id
	where tracks_id is null  

--8. �����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������);
select name_artist, time_tracks from tracks t 
	right join album a on a.id = t.id_album 
	right join artist_album aa on aa.album_id = a.id
	right join artist a2 on a2.id = aa.artist_id 
	group by name_artist, time_tracks 
		having time_tracks = (select min(time_tracks) from tracks t2)

--9. �������� ��������, ���������� ���������� ���������� ������.
select name_album from album a
right join tracks t on t.id_album  = a.id 
where t.id_album in (select id_album from tracks
    group by id_album
    having count(id) = (select count(id) from tracks
        group by id_album
        order by count
        limit 1)
)
order by name_album		

		

