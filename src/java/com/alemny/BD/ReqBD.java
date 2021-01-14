/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alemny.BD;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.Vector;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author chaima
 */
public class ReqBD {

    public String InsertDB(String TableName, Vector<String> Columns, Vector<String> Values){
     MongoClient mongo = new MongoClient( "localhost" , 27017 ); 
     MongoDatabase database = mongo.getDatabase("eLearning"); 
     MongoCollection<Document> collection;
     collection = database.getCollection(TableName); 
     Document document = new Document();
     for (int i = 0 ; i<Columns.size();i++){
         document.append(Columns.elementAt(i), Values.elementAt(i));
     }
      collection.insertOne(document); 
      return document.get("_id").toString();
      
    }
    
    public void UpdateDB(String table , Vector<String> Columns, Vector<String> Values, String id){
        MongoClient mongoClient;
        DBCollection coll = null;
        try {
            mongoClient = new MongoClient("localhost", 27017);
            DB db = mongoClient.getDB("eLearning");
            coll = db.getCollection(table);
            BasicDBObject searchQuery = new BasicDBObject("_id", new ObjectId(id));
            BasicDBObject updateFields = new BasicDBObject();
            for (int i = 0 ; i<Columns.size();i++){
            updateFields.append(Columns.elementAt(i), Values.elementAt(i));
            }
            BasicDBObject setQuery = new BasicDBObject();
            setQuery.append("$set", updateFields);
            coll.update(searchQuery, setQuery);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
