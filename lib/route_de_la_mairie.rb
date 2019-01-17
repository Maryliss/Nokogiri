require 'rubygems'
require 'nokogiri'   
require 'open-uri'

page_ville = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

page = Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/95/avernes.html'))

e_mail = page.xpath('//*/tr[4]/td[2]')

# print e_mail.text

ville = page_ville.xpath('//p/a')

ville.each do |x|
    puts x.text
end



# ville.each do |x|
#     puts x.text
# end

# def get_townhall_email (townhall_url)





# end 



                        

                        