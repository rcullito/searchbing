Configuration
=============
You can crate a new account for the Bing Search API and obtain account key can be found at http://www.bing.com/developers/

Usage
============
1. create a new search object from the Bing class. Enter your recently obtained account key, the number of results you would like, and the search type.
2. valid search types include: Image, Web, or Video. The first letter must be capitalized

Example 
===============
1. animals = Bing.new('account_key', 10, 'Image')   

2. animals.search("lion")   
