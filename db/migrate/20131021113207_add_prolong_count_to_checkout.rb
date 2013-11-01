class AddProlongCountToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :prolongcount, :integer
  end
end
