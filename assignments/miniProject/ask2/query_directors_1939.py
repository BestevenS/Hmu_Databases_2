# (a)
from mongodb_connection import db

directors = db.name_basics.find({"primaryProfession": "director", "birthYear": 1939}, {"primaryName": 1, "_id": 0})

for director in directors:
    print(director['primaryName'])
