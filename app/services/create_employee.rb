class CreateEmployee
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
    HTTParty.post(build_url, headers: build_headers, body: build_body)
  end

  def build_body
    {
        user: {
            name:         @args[:employees][:name],
            paternal:     @args[:employees][:paternal],
            maternal:     @args[:employees][:maternal],
            rfc:          @args[:employees][:rfc],
            email:        @args[:employees][:email],
            phone:        @args[:employees][:phone],
            city:         @args[:employees][:city],
            number_ext:   @args[:employees][:number_ext],
            number_int:   @args[:employees][:number_int],
            postal_code:  @args[:employees][:postal_code],
            state:        @args[:employees][:state],
            suburb:       @args[:employees][:suburb],
            address:      @args[:employees][:address],
            companies_id: @args[:employees][:companies_id]
        },
        password:     @args[:employees][:password],
        password_confirmation: @args[:employees][:password_confirmation]
    }
  end

  def build_url
    ENV['URL_API'] + "/api/v1/users"
  end

  def build_headers
    {
        "Authorization"  => "Bearer #{ENV['TOKEN']}" # @token
    }
  end
end