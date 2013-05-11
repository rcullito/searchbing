class Bing
	def initialize(accountKey, num_results, type)
		@accountKey = accountKey
		@num_results = num_results
		@type = type
	end

	attr_accessor :accountKey, :num_results, :type

	def search(search_term)
		user = ''
		web_search_url = "https://api.datamarket.azure.com/Bing/Search/#{type}?$format=json&Query="
		deuxieme = URI.encode_www_form_component('\'' + search_term + '\'')
		specs = "&$top=#{@num_results}"
		youknow = web_search_url + deuxieme + specs

		uri = URI(youknow)
		req = Net::HTTP::Get.new(uri.request_uri)
		req.basic_auth user, accountKey

		res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
  			http.request(req)
		}

		res.body
	end	
end
