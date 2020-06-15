class EmojiScraper

  def self.wip_warning
    puts 'Still working on this!'
    sleep (1)
    print 'Sorry, check back later'
    4.times do
      print '.'
      sleep (0.66)
    end

    puts "\n"

    print ' ...'
    sleep(0.5)
    print `throwing it to the nokogiri/pry, give it all she's got cap'n.`

  end

  def self.main
    wip_warning

    # binding.pry
    system 'clear'
  end

end
