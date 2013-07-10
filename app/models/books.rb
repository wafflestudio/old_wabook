class Books < ActiveRecord::Base
  attr_accessible :author, :category, :publisher, :title
end
