class GetCompanies

  def initialize(args)
    @token = args
    puts "TOKEN: #{@token}"
    @options = {
        headers: build_headers
    }
  end

  # Public Interface
  def self.send(*args)
    new(*args).send!
  end

  def send!
    HTTParty.get(build_url, @options)
  end

  def build_url
    'https://api-rh.herokuapp.com/api/v1/companies'
  end

  def build_headers
    {
        "Authorization"  => "Bearer 63373da92c14164c1b56347a86f93283f472d0d4ede613348efcb49cc9f8188b"# + ' 311632302fa55c630009b1ae256b849b619afa88037b01291daf224e3867e3f3'#@token
    }
  end

end