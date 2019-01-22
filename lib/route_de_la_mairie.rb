require 'rubygems'
require 'nokogiri'   
require 'open-uri'


class Scrapper

    # choper l'email d'une ville
    def get_townhall_email

        # page de la ville d'averne
        Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/95/avernes.html')).xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
        
    end

    # choper les URLS de chaque ville 
    def get_townhall_urls 
        # (page_villes)
        # page liste des villes 
        Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html')).xpath('//*/p/a/@href')
        # return lien.text
    end


    def update_arrays 
        # creation array
        array_url = []
        # stock les url dans tableau 
        get_townhall_urls.each do |lien|
            array_url << lien.text
        end
        # suppr le premier caractere de chaque element du array (.)
        array_url.each {|v| v[0] = ""}
        # assemblage de l'URL de base avec element du array_villes.
        array_emails = []
        array_url.each do |x|
            url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com" + x)).xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
            array_emails << url.text
        end
        #Affiche les noms de villes
        lien = get_townhall_urls.xpath('//*/td/p/a')
        #création d'un tableau avec les noms de villes
        array_city_names = []
            lien.each do |name|
                array_city_names << name.text
            end
        #création d'un hash avec les noms de villes et les mails
        hash_annuaire = {}
        array_city_names.zip(array_emails) {|a,b| hash_annuaire[a] = b }
        array_final = []
        hash_annuaire.each do |key, value|
            array_annuaire = Hash.new
            array_annuaire[key] = value
            array_final << array_annuaire
        end

        print array_final
    end
  
    # end of class
end

    a = Scrapper.new

    a.get_townhall_email
    a.get_townhall_urls 
    a.update_arrays

    
