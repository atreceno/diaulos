-- Delete data
delete from competition;
delete from phase;
delete from event;
delete from discipline;
delete from event_gender;
delete from venue;
-- Set ID back to 1
alter table event auto_increment = 1;
alter table phase auto_increment = 1;
alter table competition auto_increment = 1;
-- Venue
load data infile '/Users/atreceno/Development/london2012_cc/17_venue.txt' into table venue fields terminated by '\t' lines terminated by '\n' ignore 1 lines (@code, @is_competition, @description, @name, @description_fr, @name_fr) set code = @code, name = @name, description = @description, capacity = 0, address = 'unknown', version = 0;
-- Event Gender
insert into event_gender (code, name, version) values ("M", "Men", 0);
insert into event_gender (code, name, version) values ("W", "Women", 0);
insert into event_gender (code, name, version) values ("X", "Mixed", 0);
insert into event_gender (code, name, version) values ("0", "Global", 0);
-- Discipline
load data infile '/Users/atreceno/Development/london2012_cc/14_discipline.txt' into table discipline fields terminated by '\t' lines terminated by '\n' ignore 1 lines (code, name, @name_fr, @is_notsport, @sport, @order, @schedule) set version = 0, description = concat(@is_notsport, @sport);
-- Event
load data infile '/Users/atreceno/Development/london2012_cc/23_event.txt' into table event fields terminated by '\t' lines terminated by '\n' ignore 1 lines (@discipline_code, @gender_code, @subcode, @event_order, name, @name_fr, @TeamEvent) set version = 0, discipline_code = @discipline_code, gender_code = @gender_code, subcode = @subcode, description = concat(@discipline_code, @gender_code, @subcode);
-- Phase
--set foreign_key_checks = 0; 
--load data infile '/Users/atreceno/Development/london2012_cc/25_phase.txt' into table phase fields terminated by '\t' lines terminated by '\n' ignore 1 lines (@discipline_code, @gender_code, @subevent_code, @subphase_code, @phase_type, @desc_en, name, @desc_fr, @name_fr) set version = 0, code = concat(@discipline_code,@gender_code,@subevent_code, @subphase_code), description = '';
--update phase p inner join event e on left(p.code, 6) = e.code set p.event_id = e.id;
-- Competition
--load data infile '/Users/atreceno/Development/london2012_cc/28_eventunit.txt' into table competition fields terminated by '\t' lines terminated by '\n' ignore 1 lines (@discipline_code, @gender_code, @subevent_code, @subphase_code, @subeventunit_code, @sche, @medal, @desc_en, name, @desc_fr, @name_fr, @eu_type, @cis, @info, @filter11, @filter12, @filter21, @filter22, @criteria) set version = 0, code = concat(@discipline_code,@gender_code,@subevent_code, @subphase_code, @subeventunit_code), description = '';
--update competition c inner join phase p on left(c.code, 7) = p.code set c.phase_id = p.id;
--set foreign_key_checks = 1;
