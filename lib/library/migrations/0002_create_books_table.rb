class CreateBooksTable < ActiveRecord::Migration[7.0]

  def change
    create_table :library_books do |t|
      t.string :title
      t.index :title, unique: true
    end
  end

end
