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

 array_of_hashes = []


currencies.each {|k, v| v[0] = ""}
currencies.transform_values!(&:to_f)


currencies.each do |key, value|
    hash = Hash.new
    hash[key] = value
    array_of_hashes << hash
end

print array_of_hashes












# final_table = []
# array_of_arrays.each do |r| 
#     final_table << {array_symbol_names[0] => array_prices[0]}
# end

# print final_table