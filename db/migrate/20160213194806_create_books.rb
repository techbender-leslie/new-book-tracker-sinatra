class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :rating
      t.string :picture_url
      t.string :genre, null: false
      t.string :format, null: false
      t.integer :release_year, null: false
      t.text :summary
      t.boolean :in_library
      t.string :lent_to

      t.timestamps null: false
  end
end
end
