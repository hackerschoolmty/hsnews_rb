require 'pry'

module HsnewsRb
  class Link < OpenStruct
    include HTTParty
    base_uri "http://localhost:3000/api"

    #attr_accessor :title, :url
    #attr_reader :created_at, :id

    #def initialize(attributes = {})
      #@id = attributes["id"]
      #@title = attributes["title"]
      #@url = attributes["url"]
      #@created_at = Date.parse(attributes["created_at"])
    #end

    def self.find(id)
      response = self.get("/links/#{id}")
      self.new(response["link"])
    end

    def self.all
      response = self.get("/links")
      response["links"].map { |attrs| self.new(attrs) }
    end
  end
end
