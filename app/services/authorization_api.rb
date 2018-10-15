class AuthorizationApi
  def initialize(args)
    @email    = args[:email]
    @password = args[:password]
  end

  # Public Interface
  def self.send(*args)
    new(*args).send!
  end

  def send!
    HTTParty.post(build_url, headers: build_headers, body: build_body.to_json)
  end

  def build_url
    ENV['URL_API'] + '/api/v1/sessions'
  end

  def build_headers
    {
        'Content-Type'  => 'application/json'
    }
  end

  def build_body
    {
        "grant_type": 'password',
        "username": @email,
        "password": @password,
        "scope": ''
    }
  end
end