class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :category
      t.string :title
      t.string :author
      t.string :publisher
      t.boolean :available
      t.integer :due
      t.integer :lender
      t.boolean :overdue

      t.timestamps
    end
  end
end
