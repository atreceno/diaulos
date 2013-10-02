insert into user (enabled, password, username, version) values (1, 'd417a32def5666de310c785e770ded20cca348fa403b3e2c49b187d2e79cf19d', 'olympic', 0);
insert into role (name, version) values ('ROLE_ADMIN', 0);
insert into user_roles (users, roles) values (1, 1);