class AddbookController < ApplicationController
  def index
    @book = Book.new
  end

 end
