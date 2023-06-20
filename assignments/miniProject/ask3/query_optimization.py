import pymongo
from mongodb_connection import db

# Για το Ερώτημα 2a
db.name_basics.create_index([("birthYear", pymongo.ASCENDING)])

# Για το Ερώτημα 2b
db.title_basics.create_index([("genres", pymongo.ASCENDING), ("numVotes", pymongo.DESCENDING), ("averageRating", pymongo.DESCENDING)])

# Για το Ερώτημα 2c
db.title_basics.create_index([("startYear", pymongo.ASCENDING), ("endYear", pymongo.ASCENDING), ("numVotes", pymongo.DESCENDING)])

# Για το Ερώτημα 2d
db.title_basics.create_index([("genres", pymongo.ASCENDING), ("startYear", pymongo.ASCENDING)])

# Για το Ερώτημα 2e
db.title_basics.create_index([("startYear", pymongo.ASCENDING), ("genres", pymongo.ASCENDING)])
