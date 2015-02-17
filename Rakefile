# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'nokogiri'
require 'open-uri'

Rails.application.load_tasks


namespace :db do

  desc "seed artists!"
  task :seed_artists => :environment do
    url = "http://en.wikipedia.org/wiki/List_of_hard_rock_musicians_(N%E2%80%93Z)"
    response = Nokogiri::HTML(open(url))
    artist_array = response.css('ul li a').map {|band| band.text}
    artists = Artist.all
    artist_array[16..780].each do |band|
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

end