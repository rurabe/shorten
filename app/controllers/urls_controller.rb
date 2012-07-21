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
    @new_url = Url.find(params[:id])
    @link = @new_url.to_s
  end

  def create
    @url = Url.new(:long_url => params[:long_url], :key => Url.generate_key)
    #todo - error handling
    if @url.save
      redirect_to url_path(@url)
    else
      flash[:error] = "Hmmm... I don't recognize that address. :("
      redirect_to root_path
    end
  end
  
  def new
    @most_recent_urls = Url.most_recent
  end
end