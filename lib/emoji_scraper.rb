require 'pry'
require 'open-uri'
require 'nokogiri'
require 'csv'

class EmojiScraper

  def self.init *url, page
    url[0].length > 0 ? base_url = url : base_url = $base_url

    # Default search list will be 19
    # 19 === slackmoji.com "random" list page (a few thousand emojis! [approx. 6800?]) ~~~
    page[:url].nil? ? page = '19' : nil

    # TODO: Add more html variables
    # # # # This could be a modular system, with the user ~~~
    html = open(base_url.to_s + "categories/" + "#{page.to_s}" + "-random-emojis")
    doc = Nokogiri::HTML(html)

    saved_name_list = []
    link_extensions_list = []
    list = doc.search("ul.emojis").children.search("a")

    # get names
    saved_name_list.push(
      list.map{|file_names| file_names.attributes["download"].value})

    # get links
    link_extensions_list.push(
      list.map{|links| links.attributes["href"].value})

    emoji_list = []
    i = 0
    saved_name_list.count.times do
      i += 1
      Emoji.create(
        name: saved_name_list[i],
        url: link_extensions_list[i])
      emoji_list << Emoji
    end

    console.log(saved_name_list, link_extensions_list, emoji_list)
    binding.pry

    intermediary_prompt emoji_list
  end

  def self.intermediary_prompt emoji_list
    binding.pry

    # TODO: Setting this up here so we can prompt
    # # # # users before generating a .csv file ~~~

    write_to_csv emoji_list
  end

  def self.write_to_csv doc

    CSV.open('~/utility/data.csv', "w") do |csv|
      csv << doc
    end
  end

  def self.main *url, page
    init url, page
    system 'clear'
  end
end
