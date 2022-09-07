class Veterinarian
  attr_reader :name, :customers
  
  def initialize(name)
    @name = name
    @customers = []
  end
  
  def add_customer(customer)
    @customers << customer
  end
  
  def list_all_customer_pets
    all_pets = @customers.flat_map do |customer|
      customer.pets
    end
    all_pets.sort_by {|pet| pet.age}.reverse
  end
  
  def count_customer_pets(customer)
    customer.pets.size
  end
end