class UrlsController < ApplicationController

  def redirect
    url = Url.find_by_key(params[:key])
    click = url.clicks.build
    #todo - error handling
    click.save
    redirect_to url.long_url
  end
  
  def show
    @most_recent_urls = Url.most_recent
    @most_popular_urls = Url.most_popular
    @new_url = Url.find(params[:id])
    @link = @new_url.to_s
  end

  def create
    @url = Url.new(:long_url => params[:long_url], :key => Url.generate_key)
    #todo - error handling
    @url.save
    redirect_to url_path(@url)
  end
  
  def new
    @most_recent_urls = Url.most_recent
    @most_popular_urls = Url.most_popular
  end
end