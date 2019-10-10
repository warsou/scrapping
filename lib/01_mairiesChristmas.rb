require 'nokogiri'
require 'open-uri'





#page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def get_townhall_email(townhall_url)
page = Nokogiri::HTML(open(townhall_url))

#def get_townhall_email(page)

mairie = page.xpath("//*/tr[4]/td[2]").text
#mairie = mairie.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)/i)
#mairie = mairie.match("\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b")

ville = page.xpath("/html/body/div/main/section[1]/div/div/div/h1").text
ville = ville.split(' - ')[0]
#mairie = mairie =~ /([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-z]+)/
pagereturn = []
 h = Hash.new
 h = { ville => mairie}
 pagereturn.push(h)

return pagereturn
end
puts get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")


def get_townhall_urls
master_page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
mairies = master_page.xpath('//* [@class="lientxt"]')
pagereturn = []
h = Hash.new
mairies.each do |urlt|
newUrl = urlt['href']
newUrl = newUrl[1..-1]

ville = urlt.text

h = { ville => "https://www.annuaire-des-mairies.com"+newUrl}
pagereturn.push(h)



end
return pagereturn

end
 puts get_townhall_urls()
