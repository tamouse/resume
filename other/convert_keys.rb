#! /usr/bin/env ruby
#
# Convert keys in yaml file to be compatible with middleman data
# (i.e. all snake_cased).
#
# Copyright (C) 2013 Tamara Temple Web Development
# Author:     Tamara Temple <tamouse@gmail.com>
# License:    MIT

require 'yaml'

def convert(obj)
  case obj
  when Hash
    convert_hash(obj)
  when Array
    obj.map {|i| convert(i)}
  else
    obj
  end
end

def convert_hash(h)
  new_hash = Hash.new
  h.each do |k,v|
    new_hash[snakify(k)] = convert(v)
  end
  new_hash
end

def snakify(key)
  key.to_s.downcase.gsub(/[[:space:]]+/,'_')
end

begin
  puts convert(YAML.load($stdin.read)).to_yaml
rescue Exception => e
  STDERR.puts "Exception raised: #{e} (#{e.class})"
  STDERR.puts e.backtrace.join("\n")
  raise e
end
