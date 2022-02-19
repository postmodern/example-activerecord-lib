require_relative 'author'
require_relative 'book'
require_relative 'book_author'

module Library
  MODELS = [
    Author,
    Book,
    BookAuthor
  ]
end
