require 'rubygems'
require 'nokogiri'   
require 'open-uri'

# page liste des villes 
page_villes = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))


# page de la ville d'averne
townhall_url = Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/95/avernes.html'))

# choper l'email d'une ville
def get_townhall_email(townhall_url)
    
    a = townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    
    puts a.text
end


# choper les URLS de chaque ville 
def get_townhall_urls (page_villes)
    lien = page_villes.xpath('//*/p/a/@href')
end


# creation array
array_url = []
# stock les url dans tableau 
get_townhall_urls(page_villes).each do |lien|
    array_url << lien.text
end



# suppr le premier caractere de chaque element du array (.)
array_url.each {|v| v[0] = ""}

# assemblage de l'URL de base avec element du array_villes.

array_emails = []
array_url.each do |x|
    url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com" + x))
    email = url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    array_emails << email.text
end



#Affiche les noms de villes
def get_city_names (page_villes)
    lien = page_villes.xpath('//*/td/p/a')
end


get_city_names (page_villes)

#création d'un tableau avec les noms de villes
array_city_names = []
    get_city_names(page_villes).each do |name|
        array_city_names << name.text
    end
    # puts array_city_names


#création d'un hash avec les noms de villes et les mails
hash_annuaire = {}
array_city_names.zip(array_emails) {|a,b| hash_annuaire[a] = b }


array_final = []

hash_annuaire.each do |key, value|
    array_annuaire = Hash.new
    array_annuaire[key] = value
    array_final << array_annuaire
end

puts array_final