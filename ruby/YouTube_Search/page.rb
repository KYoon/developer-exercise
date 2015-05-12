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

  def video_links
    links = @nokogiri_obj.search('a').map { |link| link['href']}
    video_links = links.select { |link| link[/\/watch\?v=.*/]}
    video_links.uniq![0..2]
  end

end