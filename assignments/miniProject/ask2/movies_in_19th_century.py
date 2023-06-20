# (e)
from mongodb_connection import db

pipeline = [
    {"$match": {"startYear": {"$gte": 1800, "$lt": 1900}, "titleType": "movie"}},
    {"$unwind": "$genres"},
    {"$group": {"_id": "$genres", "count": {"$sum": 1}}},
    {"$sort": {"count": -1}},
    {"$limit": 1},
]

dominant_genre = list(db.title_basics.aggregate(pipeline))
print(f"Dominant Genre: {dominant_genre[0]['_id']}, Count: {dominant_genre[0]['count']}")
