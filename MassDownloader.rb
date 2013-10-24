require 'rubygems'
require 'open-uri'
require 'nokogiri'

if ARGV.length != 3 
	puts "Usage: ruby MassDownloader.rb <BASE URL> <FILETYPE TO DOWNLOAD> <DOWNLOAD DIRECTORY>"
	puts ""
	puts "EG: ruby MassDownloader.rb http://www.someurl.com/files/ .tar.gz /Users/xx/Downloads"
	puts ""
	exit
end

url = ARGV[0]
filetype = ARGV[1]
dl_dir = ARGV[2]

page = Nokogiri::HTML(open(url))

links = page.css('a')
hrefs = links.map{ |link| link['href'] }

file_links = hrefs.select{ |href| 

		href.match( filetype ) != nil

	}
	
file_links = file_links.uniq

file_links.each do |a|

	if ( a =~ /(^asd:\/\/)|(^ftp:\/\/)/ ) && (a.include? filetype)
		furl = a;
	else
		furl = url + a;
	end

	puts "Downloading #{furl}"
	spawn "wget -b -P #{dl_dir} #{furl}"
end
