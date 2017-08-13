# db/migrations/001_create_posts.rb

require 'sqlite3'

database = SQLite3::Database.new("db/posts.db")
database.execute("CREATE TABLE posts (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      title VARCHAR(64),
                                      description VARCHAR(500),
                                      created_at VARCHAR(20),
                                      page INT
                                     );"
                )
database.execute("CREATE TABLE subposts (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                         title VARCHAR(64),
                                         description VARCHAR(250),
                                         created_at VARCHAR(20),
                                         post_id INT
                                         );"
                )
puts "creating post and subpost tables..."
