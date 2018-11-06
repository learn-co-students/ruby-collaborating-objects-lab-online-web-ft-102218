require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    file = filename.split(" - ")
    song = self.new(file[1])
    song.artist_name = file[0]
    song
    #binding.pry
  end

  def artist=(artist)
    #binding.pry
    @artist = artist unless @artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end

  def self.all
    @@all
  end
end
