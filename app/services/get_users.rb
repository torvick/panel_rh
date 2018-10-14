class GetUsers
  def initialize(args)
    puts args
    @id           = args[:employee_id]
    @companie_id  = args[:companie_id]
    @token        = args[:token]
    @options      = { headers: build_headers, query: {} }
  end

  # Public Interface
  def self.send(*args)
    new(*args).send!
  end

  def send!
    @options[:query][:companie_id] = @companie_id if !@companie_id.nil?
    HTTParty.get(build_url, @options)
  end

  def build_url
    @id.nil? ? "https://api-rh.herokuapp.com/api/v1/users" : "https://api-rh.herokuapp.com/api/v1/users/#{@id}"
  end

  def build_headers
    {
        "Authorization"  => "Bearer 63373da92c14164c1b56347a86f93283f472d0d4ede613348efcb49cc9f8188b"#@token
    }
  end
end