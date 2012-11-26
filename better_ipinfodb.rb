require 'ostruct'
require 'curb'

class BetterIpInfoDB

  base_url = "http://api.ipinfodb.com/v3"

  class << self
    attr_accessor :api_key
  end

  def self.request_full(ip)
    self.request(ip, "#{base_url}/ip-city/")
  end

  def self.request_country(ip)
    self.request(ip, "#{base_url}/ip-country/")
  end

  def self.request(ip, url)
    json = Curl.get(url, :key => self.api_key, :ip => ip, :format => 'json').body_str
    OpenStruct.new(Oj.load(json))
  end

end