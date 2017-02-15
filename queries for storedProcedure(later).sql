#### QUERIES ####

update websystique.room as r
inner join websystique.booking as b
on r.room_id = b.room_room_id
set r.room_available = true
where b.check_out_date < NOW();



delete from websystique.booking
where check_out_date < NOW();


