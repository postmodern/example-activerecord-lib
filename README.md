# example-activerecord-lib

This is an example of how to use ActiveRecord in a Ruby library, _not_ a Rails
app or Rails engine.

## Usage

```shell
$ bundle install
...
$ irb -r bundler/setup -Ilib -r library
>> Library.connect
[Library::Author(id: integer, name: string),
 Library::Book(id: integer, title: string),
 Library::BookAuthor(id: integer, author_id: integer, book_id: integer)]
>> author = Library::Author.create(name: 'Neal Stephenson')
=> #<Library::Author:0x000055d29e80e168 id: 1, name: "Neal Stephenson">
>> author.books.create(title: 'Snowcrash')
=> #<Library::Book:0x000055d29dbb5d08 id: 1, title: "Snowcrash">
>> exit
$ sqlite3 database.sqlite3
sqlite> .tables
ar_internal_metadata       library_books            
library_authors            library_schema_migrations
library_book_authors     
sqlite> SELECT * FROM library_schema_migrations;
1
2
3
sqlite> SELECT * FROM library_authors;
1|Neil Stephenson
sqlite> SELECT * FROM library_books;
1|Snowcrash
```
