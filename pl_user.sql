create or replace
function check_user_exists(
P_USER_EMAIL VARCHAR
) returns INTEGER as $$
declare
    V_COUNT INTEGER;

begin
-- CHECK IF USER EXISTS
    select
	COUNT(USER_EMAIL)
    into
	V_COUNT
from
	USERS
where
	USER_EMAIL = P_USER_EMAIL;
-- RETURN 1 IF USER EXISTS, OTHERWISE RETURN 0
    if V_COUNT > 0 then
        return 1;
else
        return 0;
end if;
end;

$$ language PLPGSQL;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--
--drop function add_new_user(
--    p_username VARCHAR, 
--    p_user_email VARCHAR, 
--    p_user_pw VARCHAR,
--    p_user_dob VARCHAR,
---- Accept as varchar
--p_user_fname VARCHAR,
--    p_user_lname VARCHAR,
--    p_user_ph VARCHAR ,
--    p_user_pp VARCHAR ,
--    p_user_bio text 
--)

create or replace
function add_new_user(
    p_username VARCHAR, 
    p_user_email VARCHAR, 
    p_user_pw VARCHAR,
    p_user_dob VARCHAR,
-- Accept as varchar
p_user_fname VARCHAR,
    p_user_lname VARCHAR,
    p_user_ph VARCHAR default null,
    p_user_pp VARCHAR default null,
    p_user_bio text default null
) returns table (q_result integer, q_message varchar) as $$
declare
    v_user_exists INTEGER;

begin
    select
	check_user_exists(p_user_email)
into
	v_user_exists;

if v_user_exists > 0 then
-- If user already exists, return an array with an error message
	return query 
		select 0::integer as q_result, 'A user with this email already exists'::varchar as q_message;
else
-- Convert p_user_dob to date type
insert
	into
	users (
    user_name,
	user_email,
	user_pw,
	user_ph,
	user_fname,
	user_lname,
	user_dob,
	user_pp,
	user_bio
        )
values (
    p_username,
    p_user_email,
    p_user_pw,
    p_user_ph,
    p_user_fname,
    p_user_lname,
    p_user_dob::DATE,
    p_user_pp,
    p_user_bio
        );
-- If insertion successful, return an array with success message
	return query 
		select 1::integer as q_result, 'SUCCESS'::varchar as q_message;
end if;

exception
when others then
-- If any exception occurs, return an array with error message
	return query 
		select 0::integer as q_result, sqlerrm::varchar as q_message;
end;

$$ language PLPGSQL;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

create or replace
function validate_login(
    p_user_email VARCHAR, 
    p_user_pw VARCHAR
) returns table (q_result integer, q_message varchar) as $$
declare
    v_user_pw VARCHAR;

begin 
	select
	user_pw
into
	v_user_pw
from
	users
where
	user_email = p_user_email;

if v_user_pw = p_user_pw then
	return query 
		select 1::integer as q_result, 'SUCCESS'::varchar as q_message;
else 
	return query 
		select 0::integer as q_result, 'PLEASE CHECK USERNAME OR PASSWORD'::varchar as q_message;
end if;
end;

$$ language PLPGSQL;
--tests
--SELECT check_user_exists('user1@example.com');
--SELECT * from add_new_user(
--    'proctest5010', 
--    'proctest3111@something.com', 
--    'somepw', 
--    '1999-01-01', 
--    'userfname', 
--    'userlname'
----    '1234567890'
----    'pp', 
----    'bio' 
--);
--
--select * from validate_login('user1@example.com', 'password1');
