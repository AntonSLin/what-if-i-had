class StocksController < ApplicationController
  before_action :find_stock, only: [:show, :edit, :update, :destroy]

  def new
    @stock = Stock.new
  end

  def create
    @user = current_user
    @portfolio = Portfolio.find(params[:portfolio_id])
    @stock = Stock.new
    @stock.portfolio = @portfolio
     if @stock.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  private

  def stock_params
    params.require(:stock)
  end

  def find_stock
    @stock = Stock.find(params[:id])
  end

end
