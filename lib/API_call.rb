# require 'open-uri'
# require 'json'

# module ApiCall
#   class GetData
#     def stock_details(symbol, start_date, end_date, amount)
#       url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{symbol}&apikey=#{alphavantage_api_key}"
#       url_json = open(url).read
#       url_hash = JSON.parse(url_json)
#     end

#     # get all the data regardless of start date, symbol or amount
#     # from some other url
#     def all_data
#       url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&apikey=#{alphavantage_api_key}"
#       url_json = open(url).read
#       url_hash = JSON.parse(url_json)
#     end
#   end
# end
