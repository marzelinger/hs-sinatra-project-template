require 'net/http'
require 'json'
require 'rubygems'
require 'rest-client'

def find_image(search)
    r = RestClient::Request.execute(method: :post, 
                            url: "https://api.vimeo.com/oauth/authorize/client",
                            payload: {grant_type: "client_credentials"},
                            user: "95010b42062f3119d09755325af58610e6621ab3",
                            password: "j94HiLP7bOjdNuz/427afyoOdzyfeMukKWongSnLWjM+hnXrNE6/uKRiwwdH8DH52SjHJx6ttFtuso5qTzrPuIl7MxmPcul4HvXi2dXhnFcpPX12Up8h9NJ7yKUISVSd")
#=> "{\"access_token\":\"scrt12334\",\"token_type\":\"bearer\",\"scope\":\"public\",\"app\":{\"name\":\"test\",\"uri\":\"/apps/79881\"}}"

    token = JSON.parse(r)["access_token"]
   # methods = RestClient::Request.execute(method: :get, url: "https://api.vimeo.com", payload: {}, headers: {"Authorization"=>"Bearer #{token}"})
    results = RestClient::Request.execute(method: :get, url: "https://api.vimeo.com/categories/musicvideos/tags/word/videos?query=#{search.gsub(" ","+")}",
                            timeout: 10, headers:  {"Authorization"=>"Bearer #{token}"})
    #/videos?query=beyonce"
    read_results = JSON.parse(results)
    final_results = read_results["data"][0]["embed"]final_results["html"].gsub("1280","600").gsub("720","338")
    return final_results
end

puts find_image("eminem")
