#!/usr/bin/env ruby
# encoding: UTF-8

# Written by: j on 11-02-2013 
# ruby 2.0.0p247
require 'coderay'

Dir.entries(Dir.pwd).each do |file|
	if "#{File.extname(file)}" == '.rb'
		Dir.mkdir('Site', 0777) unless File.directory?('Site')
		File.open("Site/#{file}.html",'w') do |fi|
			fi << "<h1>#{file}</h1>"
			fi << CodeRay.scan_file(file).div
			fi << "<br>"
			fi << "<a href='index.html'>Home</a>"
			fi.close
		end
		File.open('Site/index.html','ab+') do |fi|
			fi << "<a href=\"#{file}.html\">#{file}</a></br>"
		end
	end
end
