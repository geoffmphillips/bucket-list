class Authenticator
  
  def self.authenticated(token)
    puts "self.authenticated!"
    # 1. Decrypt the token and get the user_id
    # 2. See if that user exists
  end

  def extract_token(request)
    request.headers["Authorization"]
    # let token = 
    return token
  end
end