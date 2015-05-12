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
    until input == "exit"
      input = gets.chomp
      case input
      when "url"
        puts page.url
      when "title"
        puts page.title
      when "links"
        page.video_links.each do |link|
          puts "http://www.youtube.com#{link}"
        end
      when /[\A\/]{1}.*/
        new_url = page.url + input
        puts new_url
        page = navigate(new_url)
      end
    end
  end

end

Search.new.run!