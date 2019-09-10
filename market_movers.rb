#!/usr/bin/env ruby

require 'webshot'

at_the_races = "https://www.attheraces.com/market-movers"
odds_checker = "https://www.oddschecker.com/market-movers/horse-racing"

def readable_timestamp
  Time.now.strftime("%H.%M-%m.%d.%y")
end

def screenshot(webpage, filename)
  # Customize thumbnail generation (MiniMagick)
  # see: https://github.com/minimagick/minimagick
  ws = Webshot::Screenshot.instance
  ws.capture("#{webpage}", "#{filename}-#{readable_timestamp}.png") do |magick|
    magick.combine_options do |c|
      c.thumbnail "1000x"
      c.background "white"
      c.extent "1000x1000"
      c.gravity "north"
      c.quality 85
    end
  end
end

screenshot(at_the_races, "attheraces")
screenshot(odds_checker, "oddschecker")
