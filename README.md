[gem]: https://rubygems.org/gems/searchbing

A Ruby interface to the Bing Search API.

## Installation
    gem install searchbing


Configuration
=============
You can create a new account for the Bing Search API and obtain account key can be found at http://www.bing.com/developers/

Usage
============
1. create a new search object from the Bing class. Enter your recently obtained account key, the number of results you would like, and the search type.
2. valid search types include: Image, Web, or Video. The first letter must be capitalized
3. the searchbing gem relies on the open-uri, net/http, and json gems.

Example 
===============
1. Create a new search object.
2. Retrieve the results for a given term.
3. parse the result set depending on what you would like to retrive. 


Bing.new('your_account_key_goes_here', 10, 'Image')  

bing_results = animals.search("lion")  

puts bing_results[0]["Thumbnail"]["MediaUrl"] # puts url of thumbnail  


