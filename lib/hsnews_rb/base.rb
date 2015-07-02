module HsnewsRb
  class Base < OpenStruct
    include HTTParty
    base_uri "http://localhost:3000/api"
    headers "Accept" => "application/vnd.hsnews.com+json; version=1"
  end
end
