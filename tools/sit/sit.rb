require "mediaarts_scraper"
require "json"
require "open3"
require_relative "common"

answer = check()

open(ANSWER_PATH, "w") do |f|
  f.puts JSON.pretty_generate(answer)
end

stdout, stderr, status = Open3.capture3("diff -u #{CORRECT_ANSWER_PATH} #{ANSWER_PATH}")

if status == 0
  puts "Correct"
else
  puts "Not correct"
  puts stdout
  puts stderr
  exit 1
end

Dir.glob("examples/*.rb") do |file|
  stdout, stderr, status = Open3.capture3("ruby #{file}")

  if status == 0
    puts "SUCCEED: '#{file}'"
  else
    puts "FAILED!: '#{file}'"
    puts stderr
  end
end
