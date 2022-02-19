module Library
  class BookAuthor < ActiveRecord::Base

    self.table_name = 'library_book_authors'

    belongs_to :book, required: true

    belongs_to :author, required: true

  end
end
