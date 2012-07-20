class UrlsController < ApplicationController

  def redirect
    url = Url.find_by_key(params[:key])
    redirect_to url.long_url
  end
  
  def show
    @new_url = Url.find(params[:id])
    @link = @new_url.to_s
  end

  def create
    @url = Url.create(:long_url => URI(params[:long_url]).to_s, :key => Url.generate_key)
    redirect_to url_path(@url)
  end
end