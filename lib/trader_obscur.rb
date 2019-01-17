require 'rubygems'
require 'nokogiri'   
require 'open-uri'

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
#all_symbol_names = page.xpath('//*[@class="text-left col-symbol"]')
#all_prices = page.xpath('//*[@class="price"]')

all_symbol_names = page.xpath('//*/td[3]')
all_prices = page.xpath('//*/td[5]/a')



array_symbol_names = []
all_symbol_names.each do |name|
    array_symbol_names << name.text
end


array_prices = []
all_prices.each do |price|
    array_prices << price.text
end


 currencies = {} 
 array_symbol_names.zip(array_prices) {|a,b| currencies[a] = b }



array_of_arrays = []

 currencies.each do |x|
    array_of_arrays << x
 end


final_table = []
array_of_arrays.each do |r| 
    final_table << {array_symbol_names[r] => array_prices[r]}
end

print final_table