require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all<<song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all<<song
    song
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(song)
    self.create_by_name(song)
    self.find_by_name(song)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist_name = info[0]
    name = info[1][0...-4]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end


  def self.create_from_filename(filename)
    info = filename.split(" - ")
    artist_name = info[0]
    name = info[1][0...-4]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all<<song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
