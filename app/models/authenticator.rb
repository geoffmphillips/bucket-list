class Authenticator
  
  def self.authenticated(token)
    puts "self.authenticated!"
    # 1. Decrypt the token and get the user_id
    # 2. See if that user exists
  end
end