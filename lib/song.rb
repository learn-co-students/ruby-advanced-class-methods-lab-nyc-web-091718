require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "")
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new(name)
    self.all.last
  end

  def self.new_by_name(name)
    self.new(name)
    # new_song.name = name

  end

  def self.create_by_name(name)
    self.new(name)
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    # splitarr = filename.split(" - ") #.collect{w} w.capitalize.join
    # dataarr = splitarr.each do |x|
    #   if splitarr.index(x) == 0
    #     artist = x
    #     binding.pry
    #
    #   else
    #     title = x.split(/[ .]/).map {|w| w.capitalize}
    #     title.delete_at(-1)
    #     title.join(" ")
    #     binding.pry
    #   end

    # end
    # binding.pry
    filearr = filename.chomp(".mp3").split("-").map {|x| x.strip}
    new_song = self.new
    # binding.pry
    new_song.artist_name = filearr[0]
    new_song.name = filearr[1]
    # binding.pry
    new_song
  end

  def self.create_from_filename(filename)
    filearr = filename.chomp(".mp3").split("-").map {|x| x.strip}
    new_song = self.new
    # binding.pry
    new_song.artist_name = filearr[0]
    new_song.name = filearr[1]
    # binding.pry
    self.all << new_song
  end
  # binding.pry

  def self.destroy_all
    self.all.clear
  end

end
# binding.pry
