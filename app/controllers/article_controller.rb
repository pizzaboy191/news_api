class ArticleController < ApplicationController
  include HTTParty

  def search
  end

  def update
    @results = filter_by_title
    @urls = web_url
    @result_hash = Hash[@results.zip(@urls)]
    render :search
  end

  def filter_by_title
    content = api_call
    content["response"]["results"].map {|article| article["webTitle"]}
  end

  def web_url
    content = api_call
    content["response"]["results"].map{|result| result["webUrl"]}
  end

  private

  def fetch_data(search_term)
    base_url = "https://content.guardianapis.com/search?"
    api_key = ENV['GUARDIAN_KEY']
    q = search_term
    request = HTTParty.get("#{base_url}q=#{q}&api-key=#{api_key}")
  end

  def api_call
    fetch_data(params["article_search"]["search"])
  end
end

