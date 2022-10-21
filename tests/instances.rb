require 'csv'
require 'faraday'
require 'nokogiri'

hash = CSV.read( '_data/installation-list.csv', headers: true )

hash.each do |row|
  print ":: #{row['name']} =>  "
  url_arr = []
  url_arr << row['orgurl'] if row.has_key?('orgurl')
  url_arr << row['bzurl'] if row.has_key?('bzurl')
  # Check if URLs return 200 status
  url_arr.each do |url|
    res = Faraday.get(URI(url))
    error = "✗\nNon successful status code #{res.status} when trying to access `#{url}`"
    abort("#{error}\nTry using `#{res.headers['location']}` instead") if res.status.to_i.between?(300, 399) && res.headers.has_key?('location')
    abort(error) unless res.status.to_i == 200
  end
  print "✓\n"
end
