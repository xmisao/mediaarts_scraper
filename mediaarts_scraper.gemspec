lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mediaarts_scraper/version"

Gem::Specification.new do |spec|
  spec.name          = "mediaarts_scraper"
  spec.version       = MediaartsScraper::VERSION
  spec.authors       = ["xmisao"]
  spec.email         = ["mail@xmisao.com"]

  spec.summary       = %q{Scraper for Media Art Database}
  spec.description   = %q{Ruby scraper implementation for https://mediaarts-db.bunka.go.jp/}
  spec.homepage      = "https://github.com/xmisao/mediaarts_scraper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(tools|examples|bin)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rufo", ">= 0.3.1"
  spec.add_development_dependency "pry", ">= 0.11.3"

  spec.add_runtime_dependency "nokogiri", ">= 1.8.4"
end
