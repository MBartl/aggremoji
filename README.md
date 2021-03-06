# AggrEmoji
  - a simple, web-scraping emoji aggregator tool for upping your workplace chat    
    emoji game

----------

##### Index
i)   Basics  
ii)  Set up and Usage  
iii) Testing  
iv)  Misc.

### i) Basics
* Ruby version
  - 2.6.3

* License
  - CC0 1.0 Universal Creative Commons License
  
### ii) Set Up and Usage
* Right Away
  - `bundle install`
  
* To Run
  - input `ruby bin/run.rb` from root level directory
      (or `bundle exec ruby bin/run.rb` ...)
  - follow prompts and (hopefully) aggregate some emoji
  - check out the results in your local `lib/utility/data.csv` file

### iii) Testing (note: no app specific tests written yet)
* How to run the test suite
  - `rake spec` from root directory
  - `rake spec #{test-name?}` to run targetted tests (? - please confirm) (<-- no app specific tests yet)
  - (the 15 passing tests are on a generic, non-functionining 'Widget' object)
  
* Current build only scrapes this url:
  -  https://slackmojis.com/categories/19-random-emojis
   and returns ~~different versions of lists featuring the **8668** results (currently only within your `binding.pry`)~~ the data into a .csv called 'data' located here: `lib/utility/data.csv` --> the pry's are still in code, comment them back in to see the lists mentioned <

### iv) Misc.
* To clear your local .csv file
  - `ruby bin/clear.rb`

* ... 🤠
##### comment, clone, or review at your leisure - help me build this out!
