require 'pry'
require 'net/http'
require 'tty-prompt'
require 'open-uri'
require 'nokogiri'

class EmojiScraper

  def self.init
    puts 'Still working on this!'
    sleep (1)
    print 'Sorry, check back later'
    4.times do
      print '.'
      sleep (0.66)
    end

    puts "\n"

    print '... '
    sleep(0.5)
    print "throwing it to the nokogiri/pry, give it all she's got cap'n!"
    sleep(0.2)

    scrape ("19")
  end

  def self.scrape page
    list = []

    html = open($base_url + "categories/" + "#{page}" + "-random-emojis")
    doc = Nokogiri::HTML(html)
    tips = doc.search(".emojis") #selects 12 tips

    binding.pry

    tips.with_index do |tip, index|
        puts tip.css('h4').text
        puts tip.css('p').text
        # new_tip.content = tip.attr("href")
        # list[index] = new_tip
    end
    #
    # list.sort_by! {|obj| BY WHAT}
    list
  end

  def self.main
    init

    # binding.pry
    system 'clear'
  end

end
