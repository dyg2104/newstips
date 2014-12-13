require 'open-uri'

class Nyt < ActiveRecord::Base
  API_SERVER = 'api.nytimes.com'
  API_VERSION = 'v2'
  API_NAME = 'search'
  API_BASE = "/svc/#{API_NAME}/#{API_VERSION}"

  @@api_key = File.read("./config/application.yml").chomp

  def self.set_api(key)
    @@api_key = key
  end

  def self.build_request_url(city, subject)
    URI::HTTP.build host: API_SERVER, path: "/svc/search/v2/articlesearch.json",
                    query: "fq=glocations%3A%28%22#{ city }%22%29+AND+headline.search%3A%28%22#{ subject }%22%29&api-key=#{ @@api_key }"
  end

  def self.invoke(params={})
    begin
      if @@api_key.nil?
        raise 'You must initialize the API key before you run any API queries'
      end

      city = params[:city].gsub(" ", "+")
      subject = params[:subject].gsub(" ", "+")

      p uri = build_request_url(city, subject)

      reply = uri.read
      parsed_reply = JSON.parse reply

      if parsed_reply.nil?
        raise "Empty reply returned from API"
      end

      parsed_reply
    rescue OpenURI::HTTPError => e
      if e.message =~ /^404/
        return nil
      end

      raise "Error connecting to URL #{uri} #{e}"
    end
  end

end
