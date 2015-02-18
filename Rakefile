# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'nokogiri'
require 'open-uri'

Rails.application.load_tasks


namespace :db do

  desc "seed artists!"
  task :seed_artists => :environment do
    url = "http://en.wikipedia.org/wiki/Downtempo"
    response = Nokogiri::HTML(open(url))
    artist_array = response.css('ul li a').map {|band| band.text}
    artists = Artist.all
    artist_array[4..92].each do |band|
      if band.include? "["
        next
      elsif Artist.where(name: band).any?
        puts band
        next
      else
        Artist.create(name: band)
      end
    end
  end


  desc "seed images!"
  task :seed_images => :environment do

    Artist.all.each do |artist|
      if artist.image == nil
        # artist_name = artist.name.gsub(" ", "").gsub("'", "").gsub("(", "").gsub(")", "").gsub("!", "").gsub("(?", "").gsub("&", "and")
        # begin
        #   url = "http://#{artist_name}albumcover.jpg.to"
        #   images = Nokogiri::HTML(open(url))
        # # rescue
        # #   url = "http://#{artist_name}album.jpg.to"
        # #   images = Nokogiri::HTML(open(url))
        # # rescue
        # #   url = "http://#{artist_name}music.jpg.to"
        # #   images = Nokogiri::HTML(open(url))
        # rescue
        #   puts "NOOO: " + artist.name
        #   artist.update(image: "http://favim.com/orig/201109/01/bed-guitar-shadow-tokio-hotel-tom-kaulitz-Favim.com-135652.jpg")
        #   next
        # end

        # if images.css('img')[0] && images.css('img')[0].attribute('src').to_s.length < 255
        #   artist.update(image: images.css('img')[0].attribute('src').to_s)
        #   puts "yay: " + artist.name
        # else
        artist.update(image: "http://favim.com/orig/201109/01/bed-guitar-shadow-tokio-hotel-tom-kaulitz-Favim.com-135652.jpg")
        puts "yay: " + artist.name


      else
        puts "already: " + artist.name
      end
    end
  end

end