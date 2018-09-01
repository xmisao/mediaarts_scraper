require "mediaarts_scraper"
require "json"
require_relative "common"

open(CORRECT_ANSWER_PATH, "w") do |f|
  f.puts JSON.pretty_generate(check)
end
