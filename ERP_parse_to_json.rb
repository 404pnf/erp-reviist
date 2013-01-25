# -*- coding: utf-8 -*-
require 'crack'
require 'pp'
require 'json'

# USAGE: ruby -w script.rb input.xml

# crack usage: https://github.com/jnunemaker/crack

inputfile = ARGV[0]
outputfile = ARGV[1]

(puts "\n---\nusage: ruby -w #{$0} input.xml output.json\n---\n"; exit )unless ARGV.size == 2

str = File.read inputfile
h = Crack::XML.parse str

array_of_books = h["图书流通信息"]["图书商品"]
# array_of_books是个数组，元素是每本书的信息，该信息是一个散列

erp_json = JSON.pretty_generate(array_of_books)
#erp_json = JSON.generate(array_of_books)

File.open(outputfile, 'w') do |f|
  f.puts erp_json
end


