module UrlsHelper
	def full_url(url)
		full_url = []
		full_url << request.protocol
		full_url << request.host + ":"
		full_url << request.port.to_s unless request.port == 80
		full_url <<  "/" 
		full_url <<  url.key
		full_url.join("")
	end
end
