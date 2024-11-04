class Meal
  attr_accessor :id # setter and getter
  attr_reader :name, :price # getter

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
