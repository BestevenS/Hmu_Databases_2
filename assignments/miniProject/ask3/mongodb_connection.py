from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")  # Αντικαταστήστε με το δικό σας URI αν είναι απαραίτητο
db = client['mydb']  # Αντικαταστήστε με το όνομα της βάσης δεδομένων σας
