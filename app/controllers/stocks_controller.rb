class StocksController < ApplicationController
  before_action :find_stock, only: [:show, :edit, :update, :destroy]

  def new
    @stock = Stock.new
  end

  def create
    @user = current_user
    @portfolio = Portfolio.find(params[:portfolio_id])
    @stock = Stock.new(stock_params)
    @stock.portfolio = @portfolio
     if @stock.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @stock.destroy
    redirect_to user_path(current_user)
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :amount, :start_date, :end_date)
  end

  def find_stock
    @stock = Stock.find(params[:id])
  end

end
