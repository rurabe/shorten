class UrlsController < ApplicationController

  def redirect
    url = Url.find_by_key(params[:key])
    click = url.clicks.build
    click.save
    redirect_to url.long_url
  end
  
  def show
    @most_recent_urls = Url.most_recent
    @most_popular_urls = Url.most_popular
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(params[:url])
    if @url.save
      redirect_to url_path(@url)
    else
      flash[:error] = @url.errors.full_messages
      redirect_to root_path
    end
  end
  
  def new
    @url = Url.new
    @most_recent_urls = Url.most_recent
    @most_popular_urls = Url.most_popular
  end
  
  def index
    @most_recent_urls = Url.most_recent

  end
end