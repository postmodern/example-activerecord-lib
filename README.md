# example-activerecord-lib

This is an example of how to use ActiveRecord in a Ruby library, _not_ a Rails
app or Rails engine.

## Usage

```shell
$ bundle install
$ irb -r bundler/setup -Ilib -r library
```
```ruby
Library.connect
# == 1 CreateAuthorsTable: migrating ============================================
# -- create_table(:library_authors)
#    -> 0.0012s
# == 1 CreateAuthorsTable: migrated (0.0014s) ===================================
# 
# == 2 CreateBooksTable: migrating ==============================================
# -- create_table(:library_books)
#    -> 0.0011s
# == 2 CreateBooksTable: migrated (0.0012s) =====================================
# 
# == 3 CreateBookAuthorsTable: migrating ========================================
# -- create_table(:library_book_authors)
#    -> 0.0021s
# == 3 CreateBookAuthorsTable: migrated (0.0023s) ===============================
# 
# => 
# [Library::Author(id: integer, name: string),
#  Library::Book(id: integer, title: string),
#  Library::BookAuthor(id: integer, author_id: integer, book_id: integer)]

author1 = Library::Author.create(name: 'Sam Ruby')
# => #<Library::Author:0x00007f9861f9bfe0 id: 1, name: "Sam Ruby">
author2 = Library::Author.create(name: 'Dave Thomas')
# => #<Library::Author:0x00007f9861f10a08 id: 2, name: "Dave Thomas">

book = Library::Book.create(title: 'Agile Web Development with Rails 7', authors: [author1, author2])
# => #<Library::Book:0x00007f4c5884b650
#     id: nil,
#     title: "Agile Web Development with Rails 7">
```

```shell
$ sqlite3 database.sqlite3
```
```sql
sqlite> .tables
ar_internal_metadata  library_book_authors  schema_migrations   
library_authors       library_books       

sqlite> SELECT * FROM schema_migrations;
1
2
3

sqlite> .schema library_authors
CREATE TABLE IF NOT EXISTS "library_authors" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL);
CREATE UNIQUE INDEX "index_library_authors_on_name" ON "library_authors" ("name");

sqlite> SELECT * FROM library_authors;
1|Sam Ruby
3|Dave Thomas

sqlite> .schema library_books
CREATE TABLE IF NOT EXISTS "library_books" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar);
CREATE UNIQUE INDEX "index_library_books_on_title" ON "library_books" ("title");

sqlite> SELECT * FROM library_books;
1|Agile Web Development with Rails 7

sqlite> .schema library_book_authors 
CREATE TABLE IF NOT EXISTS "library_book_authors" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "author_id" integer NOT NULL, "book_id" integer NOT NULL, CONSTRAINT "fk_rails_29993e851a"
FOREIGN KEY ("author_id")
  REFERENCES "library_authors" ("id")
, CONSTRAINT "fk_rails_7a760ae47a"
FOREIGN KEY ("book_id")
  REFERENCES "library_books" ("id")
);
CREATE INDEX "index_library_book_authors_on_author_id" ON "library_book_authors" ("author_id");
CREATE INDEX "index_library_book_authors_on_book_id" ON "library_book_authors" ("book_id");
CREATE UNIQUE INDEX "index_library_book_authors_on_author_id_and_book_id" ON "library_book_authors" ("author_id", "book_id");

sqlite> SELECT * FROM library_book_authors;
1|1|1
2|2|1
```
