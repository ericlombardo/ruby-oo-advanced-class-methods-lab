require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @@all << self.new # creates instance of song and shovels to @@all array
    @@all.last  # return song instance that was initialized and saved
  end

  def self.new_by_name(song_name)
    instance = self.new
    instance.name = song_name
    instance
  end
  
  def self.create_by_name(song_name)
    instance = self.new # create new object, assign to instance
    instance.name = song_name # assign input to instance.name
    @@all.push(instance)  # add instnce w/ name to all array
    instance  # return instance w/ name
  end
  
  def self.find_by_name(song_name)
    # searches @@all array for song name and returns instance of match
    self.all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    # checks truthy by running find_by_name method, true #=> instance of match, false #=> create_by_name method
    find_by_name(song_name) ? find_by_name(song_name) : create_by_name(song_name)
  end

  def self.alphabetical
    # sorts all objects by @name variable
    @@all.sort_by {|object| object.name}
  end

  def self.new_from_filename(file_name)
    data = file_name.split(/\s-\s|.mp3/)  # splits file_name into song name and artist name
    instance = self.new  # create new instance of Song
    instance.name = data[1] # put song name in 'name'
    instance.artist_name = data[0]  # put artist name in 'artist_name'
    instance  # return instance
  end

  def self.create_from_filename(file_name)
    data = file_name.split(/\s-\s|.mp3/) # splits file_name into song name and artist name
    instance = self.new # create new instance of Song
    instance.name = data[1] # put song name in 'name'
    instance.artist_name = data[0]  # put artist name in 'artist_name'
    @@all << instance # shovels instance w/ name and artist into @@all array
    instance # returns completed instance object
  end

  def self.destroy_all
    @@all.clear # removes everying in Song class
  end

  def save
    self.class.all << self
  end

end
