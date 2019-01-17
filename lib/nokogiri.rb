require 'rubygems'
require 'nokogiri'   
require 'open-uri'

page = Nokogiri::HTML(open('https://www.thehackingproject.org/dashboard/weeks/2/days/4?locale=fr'))
links = page.css ('a')
links.each do |link|
puts link.text
puts link["href"]
end