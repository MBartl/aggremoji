class Interface

  def self.welcome
  	system 'clear'
    puts 'Yo waddup'
    sleep (0.5)

    self.letsDoThis
  end

  def self.letsDoThis
    prompt = TTY::Prompt.new
  	puts "\n"
    choices = ['Yeah!', 'Nah.']
    nav = prompt.select('Wanna see the smiley face?' + "\n", choices)

    if nav == 'Yeah!'
      EmojiGrabber.main

      BananaMan.dance

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
