require 'pry'

class Artist
  attr_accessor :name, :songs

  @@song_count = 0
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
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

  def self.find_or_create_by_name(artist_name)
    search = self.all.detect { |artist| artist.name == artist_name }
    search ? search : self.new(artist_name)
  end

  def add_song(song)
    @@song_count += 1
    @songs << song
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

end #

