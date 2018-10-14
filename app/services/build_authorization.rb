class BuildAuthorization
  require "redis"

  def self.build!(*args)
    new(*args).build
  end

  def initialize(args)
    @args         = args
    @access_token = args[:access_token]
    @token_type   = args[:token_type]
    @expires_in   = args[:expires_in]
    @created_at   = args[:created_at]
  end

  def build
    redis = Redis.new
    return {success: true, message: "ok"} if redis.set(@token_type, @access_token)
    {success: false, message: "error"}
  end

end