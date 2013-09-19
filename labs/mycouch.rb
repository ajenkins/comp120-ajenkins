require 'couchdb'

begin
    server = CouchDB::Server.new "67.23.79.113", 5984
    database = CouchDB::Database.new server, "ajenkins"
    database.delete_if_exists!
    database.create_if_missing!
    puts "Connected to #{database} at #{server}!" 
rescue
    puts "Could not connect to the database."
end

begin
    document_one = CouchDB::Document.new database, "_id" => 
    "test_document_1", "category" => "one"
    document_one.save
    puts "#{document_one} has been saved!"
rescue
    puts "Document could not be saved."
end
