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
    choices = ['Yeah!', 'Nah.']
    nav = prompt.select('Wanna see the smiley face?' + "\n", choices)

    if nav == 'Yeah!'
      EmojiScraper.main

      puts 'bye bye, now'
      sleep (0.09)
      exit
    else
      puts 'k bye, lol 🤣'
      sleep (0.09)
      exit
    end
  end

end
