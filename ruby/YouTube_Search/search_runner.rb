require 'net/http'
require 'nokogiri'
require 'uri'
require_relative 'page'

class Search
  def navigate(search_phrase)
    webpage = Page.new(search_phrase)
    webpage.fetch!
    if webpage.redirect?
      return navigate(webpage.location)
    end
    webpage
  end

  def space_replacer(search_phrase)
    search_phrase.gsub(" ", "+")
  end

  def run!
    puts "What would you like to search?:"
    search_phrase = $stdin.gets.chomp
    page = navigate(space_replacer(search_phrase))
    input = ""
    puts "Enter 'exit' to quit or 'new search' for a new search instance."
    page.video_links.each do |link|
      puts "http://www.youtube.com#{link}"
    end
    until input == "exit"
      input = gets.chomp
      case input
      when "new search"
        Search.new.run!
      end
    end
  end

end

Search.new.run!