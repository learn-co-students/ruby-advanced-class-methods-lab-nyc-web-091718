require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def save
  #   self.class.all << self
  # end

  def self.create
    @@all << self.new
    @@all.last
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

  def self.find_by_name(song_name)

    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    create_by_name(song_name)
    find_by_name(song_name)

  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    song_info = filename.split(' - ')
    song.artist_name = song_info[0]
    song.name = song_info[1].split('.')[0]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
