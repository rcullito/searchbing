1. Configuration
You can crate a new account for the Bing Search API and obtain account key can be found at http://www.bing.com/developers/

2. Usage
	- create a new search object from the Bing class. Enter your recently obtained account key, the number of results you would like, and the search type. 
	- valid search types include: Image, Web, or Video. The first letter must be capitalized


example 
animals = Bing.new('DRkn4XEBn0A/cEQFHD4TYolM6WD0qjozdOeWvqpc9j4', 10, 'Image')
animals.search("lion")