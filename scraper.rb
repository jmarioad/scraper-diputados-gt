# This is a template for a Ruby scraper on Morph (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

url = "http://www.congreso.gob.gt/legislaturas.php"


# Read in a page
page = agent.get(url)

page.search('.dir_tabla tr').drop(1).each do |li|
  record = {
    "name" => li.search('td')[1].inner_text.squeeze(' ').strip,
    "url" => (li.search('td')[1]).at('a')["href"],
    # "member_for" => li.search('dd')[0].inner_text,
    # "party" => li.search('dd')[1].inner_text
  }
  puts '<---------------'
  puts record
  puts '--------------/>'
  # exit
  # ScraperWiki.save_sqlite(["name"], record)
end
#
# # Find somehing on the page using css selectors
# p page.at('div.content')
#
# # Write out to the sqlite database using scraperwiki library
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries. You can use whatever gems are installed
# on Morph for Ruby (https://github.com/openaustralia/morph-docker-ruby/blob/master/Gemfile) and all that matters
# is that your final data is written to an Sqlite database called data.sqlite in the current working directory which
# has at least a table called data.
