class Owner
  attr_reader :name, :species 
  attr_accessor :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end
  
   def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end 

  def walk_dogs
    @dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    @cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = @dogs+@cats
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    @dogs = []
    @cats = []
  end

  def list_pets
    number_of_dogs = self.dogs.count
    number_of_cats = self.cats.count
  end
  
end