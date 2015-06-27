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

    # params hash uses a :search key to filter links on
    # the remote
    def self.all(params = {})
      #http://localhost:3000/api/links?search=hola
      response = self.get("/links", query: params )
      response["links"].map { |attrs| self.new(attrs) }
    end
  end
end
