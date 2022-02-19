module Library
  class Author < ActiveRecord::Base

    self.table_name = 'library_authors'

    attribute :name, :string
    validates :name, presence: true,
                     uniqueness: true

    has_many :authorships, class_name: 'BookAuthor'
    has_many :books, through:    :authorships,
                     inverse_of: :authors

  end
end
