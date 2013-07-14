class Checkout < ActiveRecord::Base
  attr_accessible :book_id, :checkoutdate, :duedate, :returned, :user_id
end
