module Library
  class Author < ActiveRecord::Base

    self.table_name = 'library_authors'

    attribute :name, :string
    validates :name, presence: true,
                     uniqueness: true

    has_and_belongs_to_many :books

  end
end
