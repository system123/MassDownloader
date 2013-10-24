MassDownloader
==============

Download multiple files of the same type from a webpage or directory listing

I created this ruby script to allow me to download all the files from a directory listing of a website. 
This can be done with browser plugins but wget and ruby were quicker to implement than to try find a
browser plugin that works well.

REQUIREMENTS:

Ruby
Nokogiri Gem
Wget (You can always change the script to use CURL or whatever)

USAGE:

ruby MassDownloader.rb <HTTP or FTP URL> <Filetype> <Download Directory Path>

