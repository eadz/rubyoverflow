class Base< Hashie::Dash
  @@domain = 'http://api.stackoverflow.com/0.8/'
  class << self
    def get(url)
      location =@@domain + url
      stream = open(location) { |stream| Zlib::GzipReader.new(stream).read }
      JSON.parse(stream)
    end
  end
end