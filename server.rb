require 'sinatra'

require 'httparty'

require 'json'

require 'nokogiri'


get '/' do

stock = params[:stock]

  url = "https://www.google.com/finance?cid=22144"

  response = HTTParty.get url

  dom = Nokogiri::HTML(response.body)

  list_of_matching_spans = dom.xpath("//span[@id='ref_22144_l']")
  matching_span_element = list_of_matching_spans.first
  stock_price = matching_span_element.content

  "The current stock price of AAPL is $ #{stock_price}."

end

get '/error' do
  'boom'
end


require 'sinatra'

require 'httparty'

require 'json'

require 'nokogiri'


get '/' do

stock = params[:stock]

url = "http://finance.yahoo.com/q?s=#{stock}"
 response = HTTParty.get url


 dom = Nokogiri::HTML(response.body)

 my_span = dom.xpath("//span[@id='yfs_l84_#{stock}']").first

"The Stock you Chose is currently at $#{my_span}"

end

get '/error' do
  'boom'
end
