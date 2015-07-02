module HsnewsRb
  class Base < OpenStruct
    include HTTParty
    base_uri "https://staging-hsnews.herokuapp.com/api"
    headers "Accept" => "application/vnd.hsnews.com+json; version=1"
  end
end
