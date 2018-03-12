
class StocksController < ApplicationController
  include ApiCall
  before_action :find_stock, only: [:show, :edit, :update, :destroy]

  def new
    @stock = Stock.new
  end

  def create
    @user = current_user
    @portfolio = Portfolio.find(params[:portfolio_id])
    @stock = Stock.new(stock_params)
    @stock.portfolio = @portfolio
    # ApiCall::GetData.stock_details(@stock.symbol, @stock.start_date, @stock.end_date, @stock.amount)
    url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{@stock.symbol}&apikey=#{ENV['ALPHA_API']}"
    url_json = open(url).read
    @url_hash = JSON.parse(url_json)
     if @stock.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  # def add_new_stock
  #   symbol = params[:symbol]
  #   ApiCall::GetData.stock_details(symbol, start_date, end_date, amount)
  # end

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
