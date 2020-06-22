class Interface

  def self.welcome
  	system 'clear'
    puts 'Yo waddup'
    sleep (0.5)

    lets_do_this
  end

  def self.lets_do_this
    prompt = TTY::Prompt.new
  	puts "\n"
    choices = ["Emoji's 🦜", '💆🏼‍♀️ Banana pls', 'Byeee..🤷🏻‍♀️']
    nav = prompt.select("Wat do?" + "\n", choices)

    if nav.include? 'Emoji'
      EmojiScraper.main url: @base_url
    elsif nav.include? 'Banana'
      BananaMan.dance
    else
      puts 'k bye, lol 🤣'
      sleep (0.09)
      exit
    end
  end
end
