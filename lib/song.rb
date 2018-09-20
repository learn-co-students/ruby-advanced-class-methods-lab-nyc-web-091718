class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create #calls create, which calls .save which pushes it into array
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |s_name|
      s_name.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    #binding.pry
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(artist_file)

    artist_and_song = artist_file.split(" - ")
    artist_name = artist_and_song[0]
    song_name = artist_and_song[1].chomp(".mp3")
  #  binding.pry
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def

  self.create_from_filename(artist_file)
  artist_and_song = artist_file.split(" - ")
  artist_name = artist_and_song[0]
  song_name = artist_and_song[1].chomp(".mp3")
#  binding.pry
  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
