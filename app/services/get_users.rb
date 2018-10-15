class GetUsers
  def initialize(args)
    @id           = args[:employee_id]
    @companie_id  = args[:companie_id]
    @token        = args[:current_user]
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
    @id.nil? ? "#{ENV['URL_API']}/api/v1/users" : "#{ENV['URL_API']}/api/v1/users/#{@id}"
  end

  def build_headers
    {
        "Authorization"  => "Bearer #{@token}"
    }
  end
end