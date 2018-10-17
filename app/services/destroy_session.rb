class DestroySession

  def initialize(args)
    @token = args[:current_user]
  end

  # Public Interface
  def self.send(*args)
    new(*args).send!
  end

  def send!
    HTTParty.delete(build_url, headers: build_headers, body: build_body.to_json)
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
        "token": @token
    }
  end
end