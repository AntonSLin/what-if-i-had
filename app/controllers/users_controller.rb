class UsersController < ApplicationController

  def show
    @user = current_user
    @portfolio = Portfolio.new
    @stock = Stock.new
    @stocks = @user.portfolios[0].stocks
    @stocks_with_adjusted = {}
    @stocks.each do |stock|
      url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{stock.symbol}&apikey=#{ENV['ALPHA_API']}"
      url_json = open(url).read
      @url_hash = JSON.parse(url_json)
      @stocks_with_adjusted[stock.symbol] = @url_hash["Time Series (Daily)"][stock.start_date.to_s]["5. adjusted close"]
    end
  end

end
