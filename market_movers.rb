# Ruby script that that will identify the top 5 horses that have shortened in the market from their initial price at a particular time in the day.
  
#require 'screencap'
#
#f = Screencap::Fetcher.new('http://google.com')
#screenshot = f.fetch(
#  :output => './picture_1.png', # don't forget the extension!
#  # optional:
#  :top => 0, :left => 0, :width => 100, :height => 100 # dimensions for a specific area
#)
require 'webshot'
ws = Webshot::Screenshot.instance

#ws.capture "http://www.google.com/", "google.jpeg"
# Customize thumbnail generation (MiniMagick)
# see: https://github.com/minimagick/minimagick
ws.capture("http://www.google.com/", "google.png") do |magick|
  magick.combine_options do |c|
    c.thumbnail "1000x"
    c.background "white"
    c.extent "1000x900"
    c.gravity "north"
    c.quality 85
  end
end
