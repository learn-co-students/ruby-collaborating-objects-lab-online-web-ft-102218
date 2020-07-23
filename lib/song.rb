class Song
  attr_accessor :artist, :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.artist(name)
    @name = Artist.new(name)
  end
  
  def self.new_by_filename(filename)
    file = filename.split(" - ")
    song = self.new(file[1])
    song.artist_name = file[0]
    song
   end

  def artist=(artist)
    @artist = artist unless @artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end



