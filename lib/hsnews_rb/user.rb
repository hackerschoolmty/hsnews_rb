module HsnewsRb
  class User < HsnewsRb::Base
    
    def self.create(attributes = {})
      response = self.post("/users", body: { user: attributes } )
      self.new(response["user"])
    end

  end
end
