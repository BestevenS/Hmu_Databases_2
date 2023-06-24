import pprint
from mongodb_connection import db

# Δημιουργία των ευρετηρίων και εκτέλεση των ερωτημάτων πριν και μετά
indexes = ['birthYear', 'deathYear', 'primaryProfession', 'knownForTitles']
explanations_before = {}
explanations_after = {}

for index in indexes:
    # Ένα ερώτημα πριν την δημιουργία του ευρετηρίου
    explanations_before[index] = db.name_basics.find({index: 1990}).explain()

    print("==== Before Creating Indexes ====")
    pprint.pprint(explanations_before)

    # Δημιουργία του ευρετηρίου
    db.name_basics.create_index(index)

    # Το ίδιο ερώτημα μετά την δημιουργία του ευρετηρίου
    explanations_after[index] = db.name_basics.find({index: 1990}).explain()

    print("\n==== After Creating Indexes ====")
    pprint.pprint(explanations_after)
