require 'Pry'
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select { |x| x.length > 2 }
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end



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

require 'Pry'
class Song
  attr_accessor :name, :artist
 
  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    parsed_song = filename.split(' - ')[1]
    parsed_artist = filename.split(' - ')[0]

    new_song = self.new(parsed_song)
    new_artist = Artist.find_or_create_by_name(parsed_artist)
    
    new_song.artist = new_artist
    new_artist.songs << new_song

    new_song
  end
end #
