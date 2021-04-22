require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'pry'
require 'rubocop'

def crypto_scrapper

  crypto = []
  price = []
  combined_array = []
  i = 0

  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   


  page.xpath('//tr/td[2]').each do |name|
	  crypto << name.text
  end
  #print crypto

  page.xpath('//tr/td[5]').each do |prix|
    price << prix.text
  end
  #print price

  while crypto[i] != nil do
    combined_array << Hash[crypto[i], price[i]]
    i += 1
  end
  
  puts combined_array
  return combined_array
end

crypto_scrapper



#-----------noms
#chemin complet 
#   >>> /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]
#xpath court
#   >>> '//a[@title]'
#-----------prix
#chemin complet 
#   >>> /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]
#xpath court
#   >>> '//a[contains(@href, "markets")]'