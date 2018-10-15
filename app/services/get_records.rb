class GetRecords
  def initialize(args)
    @id_employee  = args[:employee_id]
    @id           = args[:record_id]
    @token        = args
    @options      = {
        headers: build_headers,
        query:{}
    }
  end

  # Public Interface
  def self.send(*args)
    new(*args).send!
  end

  def send!
    @options[:query][:employee_id] = @id_employee if !@id_employee.nil?
    HTTParty.get(build_url, @options)
  end

  def build_url
    @id.nil? ? "#{ENV['URL_API']}/api/v1/registrations" : "#{ENV['URL_API']}/api/v1/registrations/#{@id}"
  end

  def build_headers
    {
        "Authorization"  => "Bearer #{ENV['TOKEN']}" # @token
    }
  end
end