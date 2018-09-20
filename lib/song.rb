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
    song = self.new
    self.all << song
    song
  end # end self.create

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end # end self.new_by_name

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end # end self.create_by_name

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end # end self.find_by_name

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end # end self.find_or_create_by_name

  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end # end self.alphabetical

  def self.new_from_filename(file)
    # .chomp removes the specified block characters from string
    # ["Taylor Swift ", " Blank Space"]
    song = Song.new
    song.artist_name = file.chomp('.mp3').split(' - ')[0]
    song.name = file.chomp('.mp3').split(' - ')[1]
    song
  end # end self.new_from_filename

  def self.create_from_filename(file)
    song = Song.new
    song.artist_name = file.chomp('.mp3').split(' - ')[0]
    song.name = file.chomp('.mp3').split(' - ')[1]
    song.save # calls on the instance method save
  end # end self.create_from_filename

  def self.destroy_all
    self.all.clear
  end # end self.destroy_all
end # end Song class
