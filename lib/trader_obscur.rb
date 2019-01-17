require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def as
page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
#all_symbol_names = page.xpath('//*[@class="text-left col-symbol"]')
#all_prices = page.xpath('//*[@class="price"]')

# récuperation des symbol des cours des cryptomonnaies
all_symbol_names = page.xpath('//*/td[3]')

# récuperation des cours des cryptomonnaies
all_prices = page.xpath('//*/td[5]/a')

def trading (page)

    

    


    # création d'un array avec les symboles
    array_symbol_names = []
    all_symbol_names.each do |name|
        array_symbol_names << name.text
    end

    # création d'un array avec les cours
    array_prices = []
    all_prices.each do |price|
        array_prices << price.text
    end

    # création d'un hash avec en clé les symboles et en valeurs les cours
    currencies = {} 
    array_symbol_names.zip(array_prices) {|a,b| currencies[a] = b }

    # creation d'un array global qui contiendra les hashs pour chaque crypto
    array_of_hashes = []

    # suppression du premier caractère = $
    currencies.each {|k, v| v[0] = ""}

    # conversion en float (décimal)
    currencies.transform_values!(&:to_f)

    # creation des hashs individuel et on les stock dans l'array global (array_of_hashes)
    currencies.each do |key, value|
        hash = Hash.new
        hash[key] = value
        array_of_hashes << hash
    end

    print array_of_hashes

end

trading (page)