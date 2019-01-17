require_relative '../lib/route_de_la_mairie'

describe "The route de la mairie method" do
    it "should get the email of one cityhall" do
        expect(get_townhall_email(Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/95/avernes.html')))).to eq(a.text)
        find(:xpath, "/html")
    end
#     it "should get every town's websites URLs" do
#         expect(get_townhall_urls()).to eq(Array)
#   end 
end