# (b)
from mongodb_connection import db

top_thrillers = db.title_basics.find({"genres": "Thriller", "numVotes": {"$gte": 100000}}).sort("averageRating", -1).limit(6)
for thriller in top_thrillers:
    print(f"Title: {thriller['primaryTitle']}, Rating: {thriller['averageRating']}")
