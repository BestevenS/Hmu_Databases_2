from mongodb_connection import db

collection = db['my_collection']

# Query without index
print(collection.find({"my_field": "some_value"}).explain())

# Creating an index on the field 'my_field'
collection.create_index("my_field")
print("\n")

# Query with index
print(collection.find({"my_field": "some_value"}).explain())

# collection.drop_index("my_field")
