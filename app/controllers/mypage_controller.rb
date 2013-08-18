class MypageController < ApplicationController

    def index
    @checkout_list = Array.new
    @checkout_list_returned = Array.new

    @user = current_user
    @checkout = Checkout.all
    @checkout.each do |c|
      if c.user_id == @user.id
          list_row = Array.new
          list_row.push(c.book_id)
          list_row.push(c.checkoutdate)
          list_row.push(c.duedate)

          if c.returned
              @checkout_list_returned.push(list_row)
          else
              @checkout_list.push(list_row)
          end
        # @book_id = c.book_id
        # @book = Book.all.find_all { |a| a.id == @book_id }
        # @checkout_list.push(@book[0])
      end
    end
  end
end

