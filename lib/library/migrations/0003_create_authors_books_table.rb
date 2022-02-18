class CreateAuthorsBooksTable < ActiveRecord::Migration[7.0]

  def change
    create_table :library_authors_books do |t|
      t.references :author, null: false,
                            foreign_key: {
                              to_table: :library_authors
                            }
      t.references :book, null: false,
                          foreign_key: {
                            to_table: :library_books
                          }

      t.index [:author_id, :book_id], unique: true
    end
  end

end
