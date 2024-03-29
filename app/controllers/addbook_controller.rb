class AddbookController < ApplicationController
  def index
    if params.has_key?(:prev_book)
      @prev_added_book = Book.find_by_isbn(params[:prev_book])
    end
  end
  
  def new
    newbook = Book.new

    require 'nokogiri'
    require 'open-uri' 
    doc = Nokogiri::XML(open('http://book.interpark.com/api/search.api?key=BB76C57E2E5D09210AD11705A6102C4A9F469F0EA24C2BAF365CCF8A0DF81BCB&query='+ params[:inputISBN] + '&queryType=isbn'))

    newbook.isbn = params[:inputISBN]
    newbook.title = doc.xpath("//item/title").text
    newbook.category = doc.xpath("//item/categoryName").text
    newbook.publisher = doc.xpath("//item/publisher").text
    newbook.returned = true
    newbook.author = doc.xpath("//item/author").text
    newbook.save
   
    redirect_to :action => :index, :prev_book => params[:inputISBN]
  end

end
