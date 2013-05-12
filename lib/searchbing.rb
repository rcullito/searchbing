require 'json'
require 'open-uri'
require 'net/http'

# The Bing Class provides the ability to connect to the bing search api hosted on the windows azure marketplace.
# Before proceeding you will need an account key, which can be obtained by registering an accout at http://windows.microsoft.com/en-US/windows-live/sign-in-what-is-microsoft-account
class Bing
	# Create a new object of the bing class
	#   >> animals = Bing.new('your_account_key_goes_here', 10, 'Image') 
	#   => #<Bing:0x9d9b9f4 @account_key="your_account_key", @num_results=10, @type="Image">
	# Arguments:
	#   account_key: (String)
	#   num_results: (Integer)
	#   type: 	   (String)

	def initialize(account_key, num_results, type)

		@account_key = account_key
		@num_results = num_results
		@type = type


	end

	attr_accessor :account_key, :num_results, :type

	# Search for a term, the result is an array of hashes with the result data
	#   >> animals.search("lion") 
	#   => [{"__metadata"=>{"uri"=>"https://api.datamarket.azure.com/Data.ashx/Bing/Search/Image?Query='lion'&$skip=0&$top=1", "type"=>"Image
	# Arguments:
	#   search_term: (String)

	def search(search_term)
		 
		user = ''
		web_search_url = "https://api.datamarket.azure.com/Bing/Search/#{type}?$format=json&Query="
		query_portion = URI.encode_www_form_component('\'' + search_term + '\'')
		params = "&$top=#{@num_results}"
		full_address = web_search_url + query_portion + params

		uri = URI(full_address)
		req = Net::HTTP::Get.new(uri.request_uri)
		req.basic_auth user, account_key

		res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
  			http.request(req)
		}

		body = JSON.parse(res.body)
		result_set = body["d"]["results"]	
	end	
end