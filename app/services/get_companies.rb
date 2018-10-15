class GetCompanies

  def initialize(args)
    @token    = args[:current_user]
    @options  = {
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
    ENV['URL_API'] + '/api/v1/companies'
  end

  def build_headers
    {
        "Authorization"  => "Bearer #{@token}"
    }
  end

end