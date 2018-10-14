class CreateCheckOut
  def initialize(args)
    @args     = args
    @token    = args[:token]
    @options  = { headers: build_headers }
  end

  # Public Interface
  def self.send(*args)
    new(*args).send!
  end

  def send!
    HTTParty.put(build_url, headers: build_headers, body: build_body)
  end

  def build_body
    {
        registration: {
            check_out:  @args[:records][:check_out]
        }
    }
  end

  def build_url
    "https://api-rh.herokuapp.com/api/v1/check_out/#{@args[:id]}"
  end

  def build_headers
    {
        "Authorization"  => "Bearer 63373da92c14164c1b56347a86f93283f472d0d4ede613348efcb49cc9f8188b"#@token
    }
  end
end