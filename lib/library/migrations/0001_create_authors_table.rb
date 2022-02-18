class CreateAuthorsTable < ActiveRecord::Migration[7.0]

  def change
    create_table :library_authors do |t|
      t.string :name, null: false
      t.index :name, unique: true
    end
  end

end
