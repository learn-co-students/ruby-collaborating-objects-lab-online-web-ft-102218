require 'pry'
class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_song_by_name(title)
    song = Song.new(title)
    add_song(song)
  end

  def self.find_by_name(name)
    self.all.find{ |artist| artist.name == name }
  end

  def self.create_by_name(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.find_or_create_by_name(name)
    if artist = find_by_name(name)
      artist
    else
      create_by_name(name)
    end
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.song_count
    @@songs.length
  end
end
