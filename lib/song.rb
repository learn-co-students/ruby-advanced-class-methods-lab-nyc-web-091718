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
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by do |instance| instance.name
    end
  end

# Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return a new Song instance with the song name set to Blank Space and the artist_name set to Taylor Swift. The filename input sent to Song.new_from_filename in the format of Taylor Swift - Blank Space.mp3 must be parsed for the relevant components. Separate the artist name from the rest of the data based on the - delimiter. Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.
  def self.new_from_filename(filename)
    name_and_artist = []
    name_and_artist = filename.split(".")[0]
    artist = name_and_artist.split(" - ")[0]
    song_name = name_and_artist.split(" - ")[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    name_and_artist = []
    name_and_artist = filename.split(".")[0]
    artist = name_and_artist.split(" - ")[0]
    song_name = name_and_artist.split(" - ")[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist
    self.all << song
    song
  end

  def self.destroy_all
    @@all.clear

  end


end
