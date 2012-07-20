class UrlsController < ApplicationController
  def index

  end

  def show
    url = Url.find_by_key(params[:key])
    redirect_to url.long_url
  end

  def create
    @url = Url.create(:long_url => URI(params[:long_url]).to_s, :key => Url.generate_key)
    redirect_to root_path
  end
end