
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


  # def self.create(name)
  #     person = self.new
  #     person.name = name
  #     @@all << person
  #   end


  def self.new_by_name(name)
    song = self.new
    song.name = name
#    @artist_name = artist_name
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
#  binding.pry
      if song.name == name
        found_song = song
      end
    end
    found_song
  end


# In order to prevent duplicate songs being created that actually represent the same song (based on the song name),
#we're going to build a Song.find_or_create_by_name class method. This method will accept a string name for a song and either
#return a matching song instance with that name or create a new song with the name and return the song instance.


  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else find_by_name(name)
    end
  end


   def self.alphabetical

   end
  #
   #<Song:0x00007f9854c27b00 @name="Blank Space">
   # def self.new_from_file_name(mp3_filename)
   #   song = self.new
   #   song.
   # end
  #
  #'abc123'.chomp('123')    # => "abc"
#   song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# song.name #=> "Blank Space"
# song.artist_name #=> "Taylor Swift"
   def self.new_from_filename(mp3_name)
     mp3_name_array = mp3_name.split(" - ")

     song_name = mp3_name_array[1].chomp(".mp3")
  #   binding.pry
  #   new_by_name(@name)
     artist_name = mp3_name_array[0]
     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
  #   song.artist_name =
  #   @name.artist_name = @artist_name
  #   song = self.new
  #    song.name = @name
  #   song.artist_name = @artist_name
   end


   def create_from_file_name

   end


  def self.destroy_all
  #  @@all.clear
    self.all.clear
  end


end
