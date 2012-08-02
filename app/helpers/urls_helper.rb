module UrlsHelper
	def full_url(url)
		request.protocol + request.host + ":" + request.port.to_s + "/" + url.key
	end
end
