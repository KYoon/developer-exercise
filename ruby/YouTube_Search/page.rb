require 'openssl'
class Page
  attr_reader :url

  def initialize(search_text)
    @url = "https://www.youtube.com/results?search_query=#{search_text}"
  end

  def fetch!
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.ssl_version = :TLSv1
    http.ciphers = "ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:-LOW"
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    body = response.body
    @status_code = response.code
    @location = response.header['location']
    @nokogiri_obj = Nokogiri::HTML(body)
  end

  def redirect?
    @status_code == "301"
  end

  def title
    @nokogiri_obj.search('title').inner_text
  end

  def display
    @nokogiri_obj
  end

  def links
    @nokogiri_obj.search('a').map { |link| link['href']}
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
  end

  def paragraph_text
    @nokogiri_obj.search('p').inner_text
  end

end