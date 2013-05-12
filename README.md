Configuration
=============
You can crate a new account for the Bing Search API and obtain account key can be found at http://www.bing.com/developers/

Usage
============
1. create a new search object from the Bing class. Enter your recently obtained account key, the number of results you would like, and the search type.
2. valid search types include: Image, Web, or Video. The first letter must be capitalized

Example 
===============
1. Create a new search object  

animals = Bing.new('your_account_key_goes_here', 10, 'Image')   

2. Retrieve the results for a given term  

bing_results = animals.search("lion")  

3. parse the result set depending on what you would like to retrive  

puts result_set[0]["MediaUrl"] # puts url of fullsize image  

puts result_set[0]["Thumbnail"]["MediaUrl"] # puts url of thumbnail  


