require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |word|
      word.name
    end
  end

  def self.new_from_filename(filename)
    split_name = filename.split(/[-.]/) # splits at the - and .extension
    artist = split_name[0].strip
    name = split_name[1].strip
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    split_name = filename.split(/[-.]/) # splits at the - and .extension
    artist = split_name[0].strip
    name = split_name[1].strip
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
