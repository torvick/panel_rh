class GetRecords
  def initialize(args)
    @id      = args[:employee_id]
    @token = args
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
    @id.nil? ? "https://api-rh.herokuapp.com/api/v1/registrations" : "https://api-rh.herokuapp.com/api/v1/registrations/#{@id}"
  end

  def build_headers
    {
        "Authorization"  => "Bearer 63373da92c14164c1b56347a86f93283f472d0d4ede613348efcb49cc9f8188b"#@token
    }
  end
end