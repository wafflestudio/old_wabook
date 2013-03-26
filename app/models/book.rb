class Book < ActiveRecord::Base
  attr_accessible :author, :available, :category, :due, :lender, :overdue, :publisher, :title
end
