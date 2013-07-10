class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :category
      t.string :author
      t.string :publisher

      t.timestamps
    end
  end
end
