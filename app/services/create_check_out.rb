class CreateCheckOut
  def initialize(args)
    @args     = args
    @token = args[:current_user]
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
    ENV['URL_API'] + "/api/v1/check_out/#{@args[:id]}"
  end

  def build_headers
    {
        "Authorization"  => "Bearer #{@token}"
    }
  end
end