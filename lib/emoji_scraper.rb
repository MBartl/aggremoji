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
    # # # # This could be a modular system, with the user
    # # # # providing input, their own link, etc. ~~~
    html = open(base_url.to_s + "categories/" + "#{page.to_s}" + "-random-emojis")
    doc = Nokogiri::HTML(html)
    list = doc.search("ul.emojis").children.search("a")

    # get names (file name w/out extension)
    name_list = list.map{|file_names| file_names.attributes["download"].value.split('.').first}

    # get file names
    file_name_list = list.map{|file_names| file_names.attributes["download"].value}

    # get links
    link_extensions_list = list.map{|links| links.attributes["href"].value}

    puts "This will take a minute!"
    emoji_list = []

    i = 0
    name_list.count.times do
      i += 1
      if i % 300 == 0
        print '.'
      end

      emoji = Emoji.new(
        name: name_list[i],
        file: file_name_list[i],
        url: link_extensions_list[i]
      )

      if emoji_list.find{|e| e.name == emoji.name}
        num = 1

        if emoji.name.include?('[')
          num = emoji.name.split('[')[1].to_i
          num += 1
          binding.pry
        end

        num = num.to_s
        emoji.name += '[' + num + ']'
        emoji.file = emoji.name + '.' + emoji.file.split('.')[1]
      end

      emoji_list << emoji
    end

    puts name_list, file_name_list, link_extensions_list, emoji_list
    binding.pry

    intermediary_prompt emoji_list
  end

  def self.intermediary_prompt emoji_list
    # TODO: Setting this up here so we can prompt
    # # # # users before generating a .csv file
    # # # # users could choose where the want the file, how to modify,
    # # # # could check on it etc. etc. more options - this option is useless
    # # # # now, but intended for scaling ~~~
    # # ^^^^(probably not good dev practice but
    # # I'm hoping this will all be gone soon!)

    # binding.pry
    write_to_csv emoji_list
  end

  def self.write_to_csv doc
    require 'csv'
    CSV.open("myfile.csv", "w") do |csv|
      doc.each do |emoji|
        csv << emoji
      end
    end
  end

  def self.main *url, page
    init url, page
    system 'clear'
  end
end
