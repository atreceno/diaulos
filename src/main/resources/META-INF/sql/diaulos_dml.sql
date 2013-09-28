-- Delete data
delete from lap;
delete from race;
delete from phase;
delete from event;
delete from sport;
delete from event_gender;
delete from medal;
delete from venue;
delete from participant;
delete from country;
delete from user_roles;
delete from user;
delete from role;
delete from partic_event;
-- Set ID back to 1
alter table lap auto_increment = 1;
alter table race auto_increment = 1;
alter table phase auto_increment = 1;
alter table event auto_increment = 1;
alter table user auto_increment = 1;
alter table role auto_increment = 1;
alter table participant auto_increment = 1;
-- Sport
load data infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/discipline.txt' into table sport fields terminated by '\t' lines terminated by '\n' ignore 1 lines (code, @name, @name_fr, @is_sport, @sport, @order, @schedule) set name = @name, description = concat('Say something cool about ', @name), version = 0;
-- Event Gender
insert into event_gender (code, name, version) values ('0', 'Global', 0);
insert into event_gender (code, name, version) values ('M', 'Men', 0);
insert into event_gender (code, name, version) values ('W', 'Women', 0);
insert into event_gender (code, name, version) values ('X', 'Mixed', 0);
-- Medal
insert into medal (code, name, version) values ('1G', 'Gold', 0);
insert into medal (code, name, version) values ('2S', 'Silver', 0);
insert into medal (code, name, version) values ('3B', 'Bronce', 0);
insert into medal (code, name, version) values ('0N', 'No Medal', 0);
-- Venue
load data infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/venue.txt' into table venue fields terminated by '\t' lines terminated by '\n' ignore 1 lines (code, @comp, description, name, @desc_fr, @name_fr) set address = 'No address at the moment', capacity = 2000, version = 0;
-- Country
load data infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/country.txt' into table country fields terminated by '\t' lines terminated by '\n' ignore 1 lines (code, @desc_en, name, @desc_fr, @name_fr) set version = 0;
-- Event
load data infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/event.txt' into table event fields terminated by '\t' lines terminated by '\n' ignore 1 lines (@discipline_code, @gender_code, @subevent_code, @order, @name, @name_fr, @TeamEvent) set code = concat(@discipline_code, @gender_code, @subevent_code), name = @name, description = concat('Say something good about ', @name), sport_code = @discipline_code, gender_code = @gender_code, version = 0;
-- Phase
set foreign_key_checks = 0;
load data infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/phase.txt' into table phase fields terminated by '\t' lines terminated by '\n' ignore 1 lines (@discipline_code, @gender_code, @subevent_code, @subphase_code, @phase_type, @desc_en, @name, @desc_fr, @name_fr) set code = concat(@discipline_code,@gender_code,@subevent_code, @subphase_code), name = @name, description = concat('Say something awesome about ', @name), version = 0; 
update phase p inner join event e on left(p.code, 6) = e.code set p.event_id = e.id where p.event_id = 0;
-- Race
load data infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/eventunit.txt' into table race fields terminated by '\t' lines terminated by '\n' ignore 1 lines (@discipline_code, @gender_code, @subevent_code, @subphase_code, @subeventunit_code, @sche, @medal, @desc_en, @name, @desc_fr, @name_fr, @eu_type, @cis, @info, @filter11, @filter12, @filter21, @filter22, @criteria) set code = concat(@discipline_code,@gender_code,@subevent_code, @subphase_code, @subeventunit_code), name = @name, description = concat('Say something stunning about ', @name), official = 0, version = 0;
update race c inner join phase p on left(c.code, 7) = p.code set c.phase_id = p.id, start_date = now(), finish_date = now(), venue_code = 'OPK' where c.phase_id = 0;
set foreign_key_checks = 1;
-- Laps (adding 10 laps for testing)
set @num = 10;
insert into lap(code, race_id, version) select concat(ra.code, @num:=@num+1), ra.id, 0 from race ra limit 10;
-- User and Role
load xml infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/user.xml' into table diaulos_db.user (@id, enabled, password, username, @version) set version = 0;
load xml infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/role.xml' into table diaulos_db.role (@id, name, @version) set version = 0;
load xml infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/user_roles.xml' into table diaulos_db.user_roles (users, roles);
-- Participant (CM)
-- load xml infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/cm-participants.xml' into table diaulos_db.participant rows identified by '<athlete>' (@athleteurl, @firstname, @lastname, @birthdate, gender, height, weight, @smallphotourl, @countrycode, @countryname) set first_name = @firstname, last_name = @lastname, birth_date = @birthdate, code = concat('A',lpad(floor(rand() * 100000), 6, '0')), country_code = @countrycode, email = 'one.two@three.com', version = 0;
-- Register Participans to Events (CM)
-- set @rank = 0;
-- insert into partic_event (rank, result, medal_code, event_id, participant_id, version) select @rank:=@rank+1 as rank, 222.22 - @rank, '0N', 142, p.id, 0 from participant p where p.gender = 'M';
-- set @rank = 0;
-- insert into partic_event (rank, result, medal_code, event_id, participant_id, version) select @rank:=@rank+1 as rank, 222.22 - @rank, '0N', 143, p.id, 0 from participant p where p.gender = 'F';
-- set @rank = 0;
-- insert into partic_phase (rank, result, qualified, phase_id, participant_id, version) select @rank:=@rank+1 as rank, 333.33 - @rank, 0, 663, p.id, 0 from participant p where p.gender = 'M';  
-- set @rank = 0;
-- insert into partic_phase (rank, result, qualified, phase_id, participant_id, version) select @rank:=@rank+1 as rank, 333.33 - @rank, 0, 666, p.id, 0 from participant p where p.gender = 'F';  
-- Load all participants
load xml infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/participants.xml' into table diaulos_db.participant rows identified by '<athlete>' (code, @firstName, @lastName, gender, @birthDate, weight, height, @organisation, @tournaments) set first_name = @firstName, last_name = @lastName, birth_date = @birthDate, country_code = @organisation, email = "one.two@three.com", version = 0;
create table pe_aux (e_code varchar(255), p_code varchar(255));
load xml infile '~/Development/git/diaulos/src/main/resources/META-INF/sql/participants.xml' into table diaulos_db.pe_aux rows identified by '<tournaments>' (@code, @tournaments) set p_code = @code, e_code = @tournaments;
insert into partic_event (event_id, participant_id, version) select e.id, p.id, 0 from event e inner join participant p inner join pe_aux a where e.code = a.e_code and p.code = a.p_code;
drop table pe_aux;
-- Some start lists
insert into partic_phase (participant_id, phase_id, version) select pa.id, ph.id, 0 from participant pa inner join phase ph limit 10;
insert into partic_race (participant_id, race_id, version) select pa.id, ra.id, 0 from participant pa inner join race ra limit 10;
insert into partic_lap (participant_id, lap_id, version) select pa.id, la.id, 0 from participant pa inner join lap la limit 10;
-- Uncomment to leave only a few sports
-- delete r from race r, phase p, event e, sport s where r.phase_id = p.id and p.event_id = e.id and e.sport_code = s.code and s.code not in ('CM', 'CB'); 
-- delete p from phase p inner join event e on p.event_id = e.id inner join sport s on e.sport_code = s.code where s.code not in ('CM', 'CB');
-- delete e from event e inner join sport s on e.sport_code = s.code where s.code not in ('CM', 'CB');
-- A few interesting queries
-- delete p from phase p, event e, sport s where p.event_id = e.id and e.sport_code = s.code and s.code not in ('CM', 'CB');
-- select p.* from phase p, event e, sport s where p.event_id = e.id and e.sport_code = s.code and s.code in ('CM');
-- select p.* from phase p inner join event e on p.event_id = e.id inner join sport s on e.sport_code = s.code where s.code in ('CM');
-- select substring(@athleteurl, 10, length(@athleteurl) - 10);