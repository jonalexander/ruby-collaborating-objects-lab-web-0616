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
