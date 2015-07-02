require 'singleton'

module HsnewsRb
  class Session < HsnewsRb::Base
    include Singleton

    attr_reader :current_user

    def initialize
      @current_user = nil
    end

    def create_with_email_and_password(email, password)
      credentials = { email: email, password: password }
      response = self.class.post("/sessions", body: {session: credentials })

      if response.success?
        @current_user = HsnewsRb::User.new(response['user'])
        self.class.headers "Authorization" => "Token token=#{@current_user.auth_token}; email=#{@current_user.email}"
      else
        raise Exception
      end
    end
  end
end
