class JsonWebToken
  # secret to encode and decode token
  
  ALGORITHM = "HS256"

  def self.encode(payload, exp = 4.hours.from_now)
    # set expiry to 24 hours from creation time
    
    payload[:exp] = exp.to_i
    # sign token with application secret
    JWT.encode(payload, auth_secret, ALGORITHM, { typ: 'JWT' })
  end

  def self.decode(token)
    # get payload; first index in decoded Array
    body = JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM })[0]
    HashWithIndifferentAccess.new body
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end

  def self.auth_secret
    Rails.env.development? ? "ea92b6728a57da63f7d8f4a7981d5a2324c348b78691ebae63e680decfb26a5e643bda028ec400586826bf5bc14cfc2315ed2f8f958ebd78bc1a2fae50a71ebd" : ENV["JWT_KEY_BASE"]
  end
end