from mongodb_connection import db

for index in db.name_basics.list_indexes():
    print(index)