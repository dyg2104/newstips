require 'json'

class Api::RelatedArticlesController < ApplicationController

  def index
    city, subject = params[:city], params[:subject]
    response = Nyt.invoke(city: city, subject: subject)['response']['docs']
    @related_articles = []
    response.each do |article|
      # @related_articles << { url: article['web_url'], headline: article['headline']}
      @related_articles << article['headline']['main']
    end
  end

end
