class Artist
    attr_accessor :name
    attr_reader :songs
    
    @@all = []

    def initialize(name)
        self.name = name
        @songs = []
    end

    def add_song(song)
        self.songs << song
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

    def self.all 
        @@all
    end

    def save
        self.class.all << self
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end 
    end
end
