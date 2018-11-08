
class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path

    end

    def files
        Dir.glob(self.path+"/*.mp3").map { |s| s.gsub!(self.path+"/", "") }
    end
    
    def import
      self.files.each {|filename| Song.new_by_filename(filename)}
    end

end
