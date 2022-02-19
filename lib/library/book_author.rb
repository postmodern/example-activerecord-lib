module Library
  class BookAuthor < ActiveRecord::Base

    self.table_name_prefix = 'library_'

    belongs_to :book, required: true

    belongs_to :author, required: true

  end
end
