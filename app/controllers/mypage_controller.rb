class MypageController < ApplicationController
  require 'pp'
  def index
    @currcheckouts = current_user.checkouts.find_all_by_returned(false)
    @prevcheckouts = current_user.checkouts.find_all_by_returned(true)
    respond_to do |format|
      format.html
      format.json {
        render :json => {cur_checkouts: @currcheckouts, prev_checkouts: @prevcheckouts}
      }

    end
  end

  def return
    book = Book.find(params[:book_id])
    book.returned = true
    book.save

    checkout = Checkout.find(params[:check_id])
    checkout.returned = true
    checkout.save

    cur_checkouts = current_user.checkouts.find_all_by_returned(false)

    render :json => cur_checkouts.to_json
  end


  def prolong
    @checkout = Checkout.find(params[:check_id])

    if @checkout.prolongcount > 2
      render :json => {status: "error"}
    else
      @checkout.duedate = @checkout.duedate+7.day
      @checkout.prolongcount = @checkout.prolongcount+1
      @checkout.save
      render :json => {status: "OK"}

      #render :json => @checkout.to_json
    end
  end
end

