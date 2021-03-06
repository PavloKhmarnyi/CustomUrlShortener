class RoutesController < ApplicationController
  def index
    longUrl = params["longUrl"]
    require 'net/http'
    require 'json'
    
    if longUrl != nil
       url = "http://api.bit.ly/shorten?version=2.0.1&login=o_607qmg1ig1&apiKey=R_7f81a1e566a74fc5bd2b8dce646d1534&longUrl=" + longUrl
       result = Net::HTTP.get(URI.parse(url))
       parsed_json = ActiveSupport::JSON.decode(result)
       
       shortUrl = parsed_json["results"][longUrl]["shortUrl"]
    end
    
    @url = longUrl
    @shortUrl = shortUrl
  end

end
