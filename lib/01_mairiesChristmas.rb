require 'nokogiri'
require 'open-uri'



#page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
def one_wmca
page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))

#def get_townhall_email(page)

mairies = page.xpath("//*/tr[4]/td[2]")

mairies.each do |email|
  puts email.text
end

end
one_wmca()

def other_wmca
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"))


end

#get_townhall_email("")
