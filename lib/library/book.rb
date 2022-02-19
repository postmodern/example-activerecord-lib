module Library
  class Book < ActiveRecord::Base

    self.table_name_prefix = 'library_'

    attribute :title, :string
    validates :title, presence: true,
                      uniqueness: true

    has_many :book_authors
    has_many :authors, through:    :book_authors,
                       inverse_of: :books

  end
end
