require 'sinatra'

require 'httparty'

require 'json'

require 'nokogiri'


get '/' do

stock = params[:stock].downcase

url = "http://finance.yahoo.com/q?s=#{stock}"
 response = HTTParty.get url

 dom = Nokogiri::HTML(response.body)

 my_span = dom.xpath("//span[@id='yfs_l84_#{stock}']").first

"The Stock you selected is currently at $#{my_span}"

end

get '/error' do
  'boom'
end
