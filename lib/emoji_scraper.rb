require 'pry'
require 'open-uri'
require 'nokogiri'
require 'csv'

class EmojiScraper

  def self.init *url, page
    url[0].length > 0 ? base_url = url : base_url = $base_url

    # Default search list will be 19
    # 19 === slackmoji.com "random" list page (a few thousand emojis!)
    page[:url].nil? ? page = '19' : nil

    # binding.pry

    # TODO: Add more html variables
    html = open(base_url.to_s + "categories/" + "#{page.to_s}" + "-random-emojis")
    doc = Nokogiri::HTML(html)


    link_and_description = doc.search(".g")

    console.log(link_and_description)

    # TODO: main scrape job --HERE--
    # TODO: Determine Implementation Strategy:
    # 1) use Emoji class/object?
    # emoji = Emoji.create()
    #
    # emoji.name = link_and_description.first.search('h3').text
    # emoji.content = link_and_description.first.search('.s').css('span').text
    # new_tip.category = "Ruby"
    # new_tip.user_created = true


    # TODO: OR ~~~~~~~~~~
    # 2) add attributes to 'doc' variable?
    # doc.img = link_and_description.first.attr('href').text
    # doc.name = junk_url.split('?q=')[1].split('&sa=')[0]

    # binding.pry

    # write_to_csv emoji
    # OR ~~~~~~~~~~
    # write_to_csv doc
  end

  # def self.scrape_name_and_pic
  #
  # end

  def self.write_to_csv doc

    # TODO: Use example scraping below to locate name and picture in method, above
    # data_arr = []
    # description = doc.css("p").text.split("\n").find{|e| e.length > 0}
    # picture = doc.css("td a img").find{|picture| picture.attributes["alt"].value.include?("Douglas adams portrait cropped.jpg")}.attributes["src"].value
    #
    # data_arr.push([description, picture])

    if data == nil
      data = doc
    end

    CSV.open('utility/data.csv', "w") do |csv|
      csv << data
    end
  end

  def self.main *url, page
    init url, page
    # binding.pry
    system 'clear'
  end

end
