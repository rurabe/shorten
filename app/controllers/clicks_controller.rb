class ClicksController < ApplicationController

	def create
		url = Url.find_by_key(params[:key])
		click = url.clicks.build
		click.save
		redirect_to url.long_url
	end

end
