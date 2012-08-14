class UrlsController < ApplicationController

  before_filter :fetch_lists, :only => [:show, :new]
  
  def show
    @url = Url.find(params[:id])
    @user = User.new
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
    @user = User.new
  end

  private

  def fetch_lists
    @most_recent_urls = Url.most_recent
    @most_popular_urls = Url.most_popular
    @user_urls = Url.most_recent
  end
  
end