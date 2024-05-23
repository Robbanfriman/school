from robot.api.deco import keyword
from pymongo import MongoClient


class customLibrary2:
    def __init__(self):
        self.client = None
        self.db = None

    @keyword
    def connect_to_mongodb(self, connection_string):
        self.client = MongoClient(connection_string)
        self.db = self.client.get_default_database()

    @keyword
    def disconnect_from_mongodb(self):
        if self.client:
            self.client.close()

    @keyword
    def insert_document(self, collection_name, document):
        if self.db:
            collection = self.db[collection_name]
            collection.insert_one(document)
            return True
        return False
