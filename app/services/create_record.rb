class CreateRecord
  def initialize(args)
    @args     = args
    @token    = args[:current_user]
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
        registration: {
            check_in:  @args[:records][:check_in],
            user_id:   (@args[:records][:employees_id].nil? ? @args[:employee_id] : @args[:records][:employees_id])
        }
    }
  end

  def build_url
    ENV['URL_API'] + "/api/v1/check_in"
  end

  def build_headers
    {
        "Authorization"  => "Bearer #{@token}"
    }
  end
end