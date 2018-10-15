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
    redis = Redis.new(host: "redis-12668.c90.us-east-1-3.ec2.cloud.redislabs.com", port: 12668, password: 'Pk05hBCLwADjuJomBufSSWruji0zjFGh')
    return {success: true, message: "ok", created_at: @created_at} if redis.set(@created_at, @access_token)
    {success: false, message: "error", created_at: nil}
  end

end