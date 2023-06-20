# (d)
from mongodb_connection import db

pipeline = [
    {"$match": {"startYear": {"$gte": 1980}, "titleType": "movie"}},
    {"$unwind": "$genres"},
    {"$group": {"_id": "$genres", "averageRating": {"$avg": "$averageRating"}, "count": {"$sum": 1}}},
    {"$sort": {"count": -1}},
]

movies_per_genre = list(db.title_basics.aggregate(pipeline))
for movie in movies_per_genre:
    print(f"Genre: {movie['_id']}, Average Rating: {movie['averageRating']:.2f}, Count: {movie['count']}")
