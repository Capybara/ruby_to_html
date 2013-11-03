#!/usr/bin/env ruby
# encoding: UTF-8

# Written by: j on 11-02-2013 
# ruby 2.0.0p247
require 'coderay'

Dir.entries(Dir.pwd).each do |file|
	if "#{File.extname(file)}" == '.rb'
		(@arr ||= []) << file
	end
end
	@arr.each_index do |i|
		Dir.mkdir('Site', 0777) unless File.directory?('Site')
		File.open("Site/#{@arr[i]}.html",'w') do |fi|
			fi << "<h1>#{@arr[i]}</h1>"
			fi << CodeRay.scan_file(@arr[i]).div
			fi << "<br>"
			fi << "<a href='index.html'>Table of Contents</a></br></br>"
			fi.puts "<a href=\"#{@arr[i + 1] || @arr[0]}.html\">Next: #{@arr[i + 1] || @arr[0]}</a></br>"
			fi.close
		end
		File.open('Site/index.html','ab+') do |fi|
			fi.puts "<a href=\"#{@arr[i]}.html\">#{@arr[i]}</a></br>"
		end
	end
