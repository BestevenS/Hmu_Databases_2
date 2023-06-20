# (c)
from mongodb_connection import db
from datetime import datetime

current_year = datetime.now().year

pipeline = [
    {"$match": {"titleType": "tvSeries", "numVotes": {"$gte": 100000}}},
    {"$addFields": {
        "endYear": {"$cond": [{"$eq": ["$endYear", "\\N"]}, current_year, "$endYear"]}
    }},
    {"$addFields": {"duration": {"$subtract": ["$endYear", "$startYear"]}}},
    {"$sort": {"duration": -1}},
    {"$limit": 10},
    {"$project": {"primaryTitle": 1, "duration": 1, "_id": 0}}
]

longest_series = list(db.title_basics.aggregate(pipeline))
for series in longest_series:
    print(f"Title: {series['primaryTitle']}, Duration: {series['duration']}")

