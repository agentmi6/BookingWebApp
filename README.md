# Create DB schema name: websystique

# set as default schema

# run the project from eclipse so the tables can be created in db

# Execute in sql script file in workbench #
###########################################

INSERT INTO USER_PROFILE(type)
VALUES ('USER');
 
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');

##########################################
# to create ADMIN account:
### go back to eclipse, create new account
### go back in workbench, open new SQL script file and execute

UPDATE websystique.app_user_user_profile
SET USER_PROFILE_ID=2
WHERE USER_ID=1;

(before executing, check the USER_ID for your registered user)
