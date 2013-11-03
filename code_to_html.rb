#!/usr/bin/env ruby
# encoding: UTF-8

# Written by: j on 11-02-2013 
# ruby 2.0.0p247
require 'coderay'

Dir.glob("**/*.rb") do |file|
		(@arr ||= []) << file
end
	@arr.each_index do |i|
		Dir.mkdir('Site', 0777) unless File.directory?('Site')
		File.open("Site/#{File.basename(@arr[i])}.html",'w') do |fi|
			fi << "<h1>#{File.basename(@arr[i])}</h1>"
			fi << CodeRay.scan_file(@arr[i]).div
			fi << "<br>"
			fi << "<a href='index.html'>Table of Contents</a></br></br>"
			if @arr[i + 1]
				fi << "<a href=\"#{File.basename(@arr[i + 1])}.html\">Next: #{File.basename(@arr[i + 1])}</a></br>"
			else
				fi << "<a href=\"#{File.basename(@arr[0])}.html\">Next: #{File.basename(@arr[0])}</a></br>"
			end
			fi.close
		end
		File.open('Site/index.html','ab+') do |fi|
			fi.puts "<a href=\"#{File.basename(@arr[i])}.html\">#{File.basename(@arr[i])}</a></br>"
		end
	end
