class Book < ActiveRecord::Base
  attr_accessible :author, :category, :isbn, :publisher, :returned, :title
  
end
