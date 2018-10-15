class BuildAuthorization
  require "redis"

  def self.build!(*args)
    new(*args).build
  end

  def initialize(args)
    @args         = args
    @access_token = args['access_token']
    @token_type   = args['token_type']
    @expires_in   = args['expires_in']
    @created_at   = args['created_at']
  end

  def build
    redis = Redis.new(host: ENV['URL_REDIS'], port: ENV['PORT_REDIS'], password: ENV['PASSWORD_REDIS'])
    if redis.set(@created_at, @access_token)
      redis.quit
      return {success: true, message: "ok", created_at: @created_at}
    end
    {success: false, message: "error", created_at: nil}
  end

end