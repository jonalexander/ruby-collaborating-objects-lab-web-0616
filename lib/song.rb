class Song
  attr_accessor :name, :artist
  #need to have an @artist attribute

  def initialize(name)
    @name = name
  end

  # #be able to edit @artist

  # def artist=(artist_name)
  #   @artist = Artist.find_or_create_by_name(artist_name)
  # end



  # def artist_name=(name)
    
  # end

  def self.new_by_filename(filename)
    #file => 
      #['Action Bronson - Song1 - rap', 'Jay Z - 99 Problems - rap']
    #creates new song/artist structure for library
    parsed_song = filename.split(' - ')[1]
    parsed_artist = filename.split(' - ')[0]

    new_song = self.new(parsed_song)    #object 1
    new_artist = Artist.find_or_create_by_name(parsed_artist)   #object 2

    new_song.artist = new_artist
    new_artist.songs << new_song

    new_song
  end
end