require 'pry'
require 'open-uri'
require 'nokogiri'
require 'csv'

class EmojiScraper

  def self.init *url, page
    url[0].length > 0 ? base_url = url : base_url = $base_url

    # Default search list will be 19
    # 19 === slackmoji.com 'random' list page (a few thousand emojis! [approx. 6800?]) ~~~
    page[:url].nil? ? page = '19' : nil

    # TODO: Add more html variables
    # # # # This could be a modular system, with the user
    # # # # providing input, their own link, etc. ~~~
    html = open(base_url.to_s + 'categories/' + "#{page.to_s}" + '-random-emojis')
    doc = Nokogiri::HTML(html)
    list = doc.search('ul.emojis').children.search('a')

    # get names (file name w/out extension)
    name_list = list.map{|file_names| file_names.attributes['download'].value.split('.').first}

    # get file names
    file_name_list = list.map{|file_names| file_names.attributes['download'].value}

    # get links
    link_extensions_list = list.map{|links| links.attributes['href'].value}

    emoji_list = []

    i = 0
    name_list.count.times do
      i += 1
      if i % 279 == 0
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
        end

        num = num.to_s
        emoji.name += '[' + num + ']'
        emoji.file = emoji.name + '.' + emoji.file.split('.')[1]
      end

      # # Enable this line if you want to
      # # persist all emojis in the local DB
      # Emoji.save

      emoji_list << emoji
    end

    # # puts name_list, file_name_list, link_extensions_list, emoji_list
    # # Check out the lists above and the pry below to see the raw data
    # binding.pry
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

    write_to_csv emoji_list
  end

  def self.write_to_csv doc
    # start with a quick reset
    CSV.open('lib/utility/data.csv', 'w') {|file| file.truncate(0)}

    # let's re-write it
    CSV.open('lib/utility/data.csv', 'w',
      :write_headers=> true,
      :headers => [
        # < column headers | 26+32 chars >
        # # # add >> '| ' << to the end
        'names                      | ' +
        'files                            | ' +
        'urls/link fragments'
      ]
    ) do |csv|
      doc.each do |emoji|
        # binding.pry
        # # TODO: Refactor two below to use a common function

        # Name columns rely on the other two being formatted. This was
        # decided because when writing rows into .csv's Ruby really
        # wants to be an array and commas are basically inevitable.
        if !emoji.name
          break
        end

        name_length = emoji.name.length
        file_length = emoji.file.length

        # This helps with formatting the file columns
        if emoji.file
          file_column_format = 26-name_length
          file_spacing = ''
          file_column_format.times{ file_spacing += ' ' }
          file_spacing += '| '
          emoji.file = file_spacing + emoji.file
        end

        # This formats the url (fragments) column
        if emoji.url
          url_column_format = 32-file_length
          url_spacing = ''
          url_column_format.times{ url_spacing += ' ' }
          url_spacing += '| '
          emoji.url = url_spacing + emoji.url
        end

        emoji_row = [emoji.name, emoji.file, emoji.url]
        csv << emoji_row
      end
    end

    maybe_redirect_them
  end

  def self.maybe_redirect_them
    system 'clear'
    sleep(2)
    puts 'I sure hope your list is written now.'
    sleep(1.5)
    puts 'go check your lib/utility/data.csv file I suppose!'
    sleep(2)
    puts '...'
    sleep(4)
    puts "I'm gonna take you back to the start now"
    sleep(1.5)
    Interface.welcome
  end

  def self.main *url, page
    puts 'This will take a minute!'
    init url, page
    system 'clear'
  end
end
