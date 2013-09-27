class BooksController < ApplicationController

  def index
    @books = Book.all
  end


  def lend
    @book = Book.find(params[:id])
    @book.returned = false
    @book.save
    render :json => @book.to_json
  end

  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to action: "index", notice: 'Booook was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
end
