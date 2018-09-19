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
    song =  self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
      @@all.find {|element| element.name == name}
  end

  def self.find_or_create_by_name(name)
    if(self.find_by_name(name) == nil)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.create_from_filename(filename)
    file_name_hold = filename.split(" - ")
    file_name_hold[1] = file_name_hold[1].gsub!(".mp3","")
    song = find_or_create_by_name(file_name_hold[1])
    song.artist_name = file_name_hold[0]
    song
  end

  def self.new_from_filename(filename)
    file_name_hold = filename.split(" - ")
    file_name_hold[1] = file_name_hold[1].gsub!(".mp3","")
    song = self.new_by_name(file_name_hold[1])
    song.artist_name = file_name_hold[0]
    song
  end

  def self.alphabetical
    @@all.sort {|left,right| left.name <=> right.name}
  end

  def self.destroy_all
    @@all = []
  end
end
