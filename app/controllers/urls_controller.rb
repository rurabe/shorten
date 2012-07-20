class UrlsController < ApplicationController
  def index

  end

  def show
  end

  def create
    @url = Url.new
    @url.long_url = "Sting"#params[:long_url]
    redirect_to root_path
  end
end