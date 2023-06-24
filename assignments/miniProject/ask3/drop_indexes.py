from mongodb_connection import db

db.name_basics.drop_index('birthYear_1')
db.name_basics.drop_index('primaryProfession_1')
db.title_basics.drop_index('genres_1')
db.title_basics.drop_index('averageRating_1')
db.title_basics.drop_index('numVotes_1')
db.title_basics.drop_index('startYear_1')
db.title_basics.drop_index('endYear_1')
