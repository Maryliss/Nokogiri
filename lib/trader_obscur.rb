require 'rubygems'
require 'nokogiri'   
require 'open-uri'

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
#all_symbol_names = page.xpath('//*[@class="text-left col-symbol"]')
#all_prices = page.xpath('//*[@class="price"]')

all_symbol_names = page.xpath('//*/td[3]')
all_prices = page.xpath('//*/td[5]')

puts all_symbol_names.length
puts all_prices.length

all_symbol_names.each do |name|
puts name.text
end

all_prices.each do |price|
puts price.text
end