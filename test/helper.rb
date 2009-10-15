$:.unshift File.dirname(__FILE__) + '/../lib'

begin
  require 'acts_as_sanitiled'
  require 'bacon'
  require 'active_support'
rescue LoadError
  puts "acts_as_sanitiled requires bacon to run its tests"
  exit
end

class ActiveRecord
  class Base
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes.dup.stringify_keys
      after_find if respond_to?(:after_find)
    end

    def method_missing(name, *args)
      if name.to_s[%r{=}]
        @attributes[key = name.to_s.sub('=','')] = value = args.first
        write_attribute key, value
      else
        self[name.to_s]
      end
    end

    def [](value)
      @attributes[value.to_s.sub('_before_type_cast', '')]
    end
  end
end unless defined? ActiveRecord

ActiveRecord::Base.send(:include, ActsAsSanitiled)

class Story < ActiveRecord::Base
  acts_as_textiled :body
  acts_as_textiled :description, [:lite_mode]
end