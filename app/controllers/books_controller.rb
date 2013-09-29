class BooksController < ApplicationController

  def index
    @books = Book.all
  end


  def lend
    @book = Book.find(params[:id])
    @book.returned = false
    @book.save

    @checkout = Checkout.new
    @checkout.book_id = params[:id]
    @checkout.user_id = current_user.id
    @checkout.checkoutdate = Time.now+9.hour
    @checkout.duedate = Time.now+9.hour+14.day
    @checkout.returned = false
    @checkout.save

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
