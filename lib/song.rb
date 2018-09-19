require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="", artist="")
     @name = name
     @artist_name = artist
     @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new
    #@@all << new_song
    #new_song
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    #binding.pry
    self.new(name)
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    tmp_song = self.find_by_name(name)
    if tmp_song == nil
      tmp_song = self.create_by_name(name)
    end
    tmp_song
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    split_file = filename.split(/(-)/)
    song = split_file[2].lstrip.chomp('.mp3')
    artist = split_file[0].strip
    Song.new(song, artist)
  end

  def self.create_from_filename(filename)
    split_file = filename.split(/(-)/)
    song = split_file[2].lstrip.chomp('.mp3')
    artist = split_file[0].strip
    Song.new(song, artist)
  end

  def self.destroy_all
    @@all = []
  end
end
