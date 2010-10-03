# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'acts_as_sanitiled/version'

Gem::Specification.new do |s|
  s.name         = "acts_as_sanitiled"
  s.version      = ActsAsSanitiled::VERSION
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Gabe da Silveira"]
  s.email        = ["gabe@websaviour.com"]
  s.homepage     = "http://github.com/dasil003/acts_as_sanitiled"
  s.summary      = "Automatically textiles and/or sanitizes ActiveRecord columns"
  s.description  = "A modernized version of Chris Wansthrath's venerable acts_as_textiled. It automatically textiles and then sanitizes columns to your specification.  Ryan Grove's excellent Sanitize gem with nokogiri provides the backend for speedy and robust filtering of your output in order to: restrict Textile to a subset of HTML, guarantee well-formedness, and of course prevent XSS."
  s.files        = Dir["lib/**/*"] + %w[LICENSE README.rdoc]
  s.require_path = "lib"
  s.rdoc_options = ["--main", "README.rdoc", "--charset=UTF-8"]
  
  s.required_ruby_version     = '~> 1.8.6'
  s.required_rubygems_version = '~> 1.3.6'
  
  {
    'bundler'       => '~> 1.0.0',
    'bacon'         => '~> 1.1.0',
    'activesupport' => '~> 3.0.0'
  }.each do |lib, version|
    s.add_development_dependency(lib, version)
  end
  
  {
    'nokogiri'  => '~> 1.3.3',
    'sanitize' => '~> 1.1.0',
    'RedCloth' => '~> 4.2.3'
  }.each do |lib, version|
    s.add_runtime_dependency(lib, version)
  end
end

