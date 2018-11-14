require 'pry'

class Song
    attr_accessor :name, :artist
    def initialize(name)
        @name = name
    end
    
    def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self)
    end
    
    def self.new_by_filename(filename)
      filename_split = filename.split(' - ')
      name = filename_split[1]
      artist = filename_split[0]
      song = Song.new(name)
      song.artist_name = artist
      song
    end
end