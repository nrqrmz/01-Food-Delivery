class Customer
  attr_accessor :id # setter and getter
  attr_reader :name, :address # getter

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
