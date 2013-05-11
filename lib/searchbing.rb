class Bing
	# Create a new object of the bing class
	#   >> animals = Bing.new('your_account_key_goes_here', 10, 'Image') 
	#   => #<Bing:0x9d9b9f4 @accountKey="your_account_key", @num_results=10, @type="Image">
	# Arguments:
	#   account_key: (String)
	#   num_results: (Integer)
	#   type: 	   (String)

	def initialize(accountKey, num_results, type)

		@accountKey = accountKey
		@num_results = num_results
		@type = type
	end

	attr_accessor :accountKey, :num_results, :type

	# Search for a term
	#   >> animals.search("lion") 
	#   => #<Bing:0x9d9b9f4 @accountKey="your_account_key", @num_results=10, @type="Image">
	# Arguments:
	#   search_term: (String)
	#    => "{\"d\":{\"results\":[{\"__metadata\":{\"uri\":\"https://api.datamarket....

	def search(search_term)
		 
		user = ''
		web_search_url = "https://api.datamarket.azure.com/Bing/Search/#{type}?$format=json&Query="
		query_portion = URI.encode_www_form_component('\'' + search_term + '\'')
		params = "&$top=#{@num_results}"
		full_address = web_search_url + query_portion + params

		uri = URI(full_address)
		req = Net::HTTP::Get.new(uri.request_uri)
		req.basic_auth user, accountKey

		res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
  			http.request(req)
		}

		res.body
	end	
end
