from mongodb_connection import db

collections = ["name_basics", "title_basics"]  # Ανάλογα με το ποιες συλλογές έχετε δημιουργήσει ευρετήρια

for collection in collections:
    print(f"\nIndexes for {collection}:")
    for index in db[collection].list_indexes():
        print(index)
