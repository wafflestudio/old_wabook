class Checkout < ActiveRecord::Base
  attr_accessible :book_id, :checkoutdate, :duedate, :return, :user_id
end
