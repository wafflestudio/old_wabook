class BooksController < ApplicationController

  include ApplicationHelper

  def index

    url = '/pagination?current_page=1'
    redirect_to url
  
  end

  def pagination
    require 'nokogiri' 
    require 'open-uri' 
    rowsPerPage = 10;
    @current_page = params[:current_page]
    @books = Book.page(@current_page).per(rowsPerPage)
    @totalCnt = Book.all.count
    @totalPageList = getTotalPageList(@totalCnt, rowsPerPage)
    @books.each do |book|
      doc = Nokogiri::XML(open('http://book.interpark.com/api/search.api?key=BB76C57E2E5D09210AD11705A6102C4A9F469F0EA24C2BAF365CCF8A0DF81BCB&query=' + book.isbn + '&queryType=isbn'))  
      book.data = {cover: doc.xpath("//item[1]/coverLargeUrl").text, 
        description: doc.xpath("//item/description").text }
    end 
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
    @checkout.prolongcount = 0
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
