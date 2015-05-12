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
    # Run the browser
    # Display a prompt for a user
    # Parse their input
    # Display useful results by instantiating
    #   a new Page and calling methods on it.
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
    puts "What would you like to search?:"
    search_phrase = $stdin.gets.chomp
    page = navigate(space_replacer(search_phrase))
    # if @webpage.status_code == '301'
    #   redirect
    # end
    puts page
    input = ""
    until input == "exit"
      input = gets.chomp
      case input
      when "url"
        puts page.url
      when "display page"
        puts page.display
      when "title"
        puts page.title
      when "links"
        puts page.links
      when "text"
        puts page.paragraph_text
      when /[\A\/]{1}.*/
        new_url = page.url + input
        puts new_url
        page = navigate(new_url)
      end
    end
  end

end

Search.new.run!