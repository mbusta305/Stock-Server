require 'sinatra'

require 'httparty'

require 'json'

require 'nokogiri'


get '/' do

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
