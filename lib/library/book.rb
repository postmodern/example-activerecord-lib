module Library
  class Book < ActiveRecord::Base

    self.table_name = 'library_books'

    attribute :title, :string
    validates :title, presence: true,
                      uniqueness: true

    has_and_belongs_to_many :authors

  end
end
