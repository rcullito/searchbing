require 'searchbing'

bing_web = Bing.new('MM6OD0qjozdOWWvspc0j4DRkn4JEBM0A/cEQFHDKTYo', 5, 'Image')
bing_web_results = bing_web.search("nantucket", 20)
puts bing_web_results