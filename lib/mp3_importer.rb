class MP3Importer
  #parses dir of files
  #sends filesname to a song class to create a library
  attr_accessor :path

  def initialize(path)
    #pass new instance a filepath to use in #files method
    @path = path
  end

  #grabs files from outside
  def files
    Dir.entries(@path).select { |x| x.length > 2 }
    #read file entries from a Directory
    #@path points to the file
    #iterate over the entries and only select the legitimate ones
    #there are items such as "." and ".." that we need to exclude
  end

  #this will be responsible for creating library
  def import
    self.files.each do |file|
      #iterate over each file and turn it into a song w/ artist
      #return array with data
      Song.new_by_filename(file)
    end
  end

end