require 'nokogiri'
require 'open-uri'

#



def mad_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
 all_currency_name = page.xpath("//*[@class='text-left col-symbol']")
 devise_name =[]
 devise_price =[]


  all_currency_name.each do |currency_name|

  devise_name.push(currency_name.text)
                        end


all_currency_price = page.xpath("//*[@class='price']")
all_currency_price.each do |currency_price|

devise_price.push((currency_price.text).delete("$")) #transforme en tableau
                        end



  i = 0
  h = Hash.new
  while i < all_currency_name.length
  puts h = { devise_name[i] => devise_price[i]}
  i += 1

  end
 # puts h.text

 #['//*[@id="currency-exchange-rates"]']

end
mad_scrapper()
