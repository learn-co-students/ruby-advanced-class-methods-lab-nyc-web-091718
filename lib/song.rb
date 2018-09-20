
require 'pry'


class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end


  def save
    self.class.all << self
  end


  def self.create
    @name = self.new
    @name.save
    @name
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end


  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end


  def self.find_by_name(name)
    found_song = nil
    @@all.map do |song|
      if song.name == name
        found_song = song
      end
    end
    found_song
  end


  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else find_by_name(name)
    end
  end


   def self.alphabetical
     @@all.sort_by do |song|
       song.name
     end
   end


   def self.new_from_filename(mp3_name)
     mp3_name_array = mp3_name.split(" - ")
     name = mp3_name_array[1].chomp(".mp3")
     artist_name = mp3_name_array[0]
     new_song = new_by_name(name)
     new_song.artist_name = artist_name
     new_song
   end


   def self.create_from_filename(mp3_name)
     @@all << new_from_filename(mp3_name)
   end


  def self.destroy_all
    self.all.clear
  end


end
