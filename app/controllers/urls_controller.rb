class UrlsController < ApplicationController

  def redirect
    url = Url.find_by_key(params[:key])
    redirect_to url.long_url
  end
  
  def show
    @all_urls = Url.order("created_at DESC")
    @new_url = Url.find(params[:id])
    @link = @new_url.to_s
  end

  def create
    @url = Url.new(:long_url => params[:long_url], :key => Url.generate_key)
    @url.save
    redirect_to url_path(@url)
  end
  
  def new
    @all_urls = Url.order("created_at DESC")
  end
end