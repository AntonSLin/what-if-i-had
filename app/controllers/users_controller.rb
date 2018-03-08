class UsersController < ApplicationController

  def show
    @user = current_user
    @portfolio = Portfolio.new
    @stock = Stock.new
  end

end
