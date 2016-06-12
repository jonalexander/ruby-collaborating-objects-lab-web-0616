class Artist
  attr_accessor :name, :songs

  @@all = []
  @@song_count = 0
  #@@songs = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@all 
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    #find artist instance w/ same name or create one
    search_result = @@all.detect { |artist| artist.name == name}
    search_result.nil? ? self.new(name) : search_result
  end

  def add_song(song)
    @songs << song
    @@song_count += 1
  end

  def print_songs
    @songs.each { |song| puts song.name}
  end
end
