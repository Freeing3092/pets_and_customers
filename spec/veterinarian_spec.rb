require './lib/veterinarian'
require './lib/customer'
require './lib/pet'

RSpec.describe Veterinarian do
  let(:veterinarian) {Veterinarian.new("Dr. Dolittle")}
  let(:joel) {Customer.new("Joel", 2)}
  let(:billy) {Customer.new("Billy", 3)}
  let(:samson) {Pet.new({name: "Samson", type: :dog, age: 7})}
  let(:lucy) {Pet.new({name: "Lucy", type: :cat, age: 3})}
  let(:molly) {Pet.new({name: "Molly", type: :cat, age: 5})}
  
  it "is an instance of its class" do
    expect(veterinarian).to be_a Veterinarian
  end
  
  it "has a name" do
    expect(veterinarian.name).to eq("Dr. Dolittle")
  end
  
  it "has an empty array of customers by default" do
    expect(veterinarian.customers).to eq([])
  end
  
  it "can add customers" do
    veterinarian.add_customer(joel)
    veterinarian.add_customer(billy)
    result = [joel, billy]
    
    expect(veterinarian.customers).to eq(result)
  end
  
  it "#list_all_customer_pets lists customer pets by age" do
    joel.adopt(samson)
    billy.adopt(lucy)
    billy.adopt(molly)
    veterinarian.add_customer(joel)
    veterinarian.add_customer(billy)
    
    result = [samson, molly, lucy]
    expect(veterinarian.list_all_customer_pets).to eq(result)
  end
  
  it "#count_customer_pets counts the pets of a customer" do
    joel.adopt(samson)
    billy.adopt(lucy)
    billy.adopt(molly)
    veterinarian.add_customer(joel)
    veterinarian.add_customer(billy)
    
    expect(veterinarian.count_customer_pets(joel)).to eq(1)
    expect(veterinarian.count_customer_pets(billy)).to eq(2)
  end
end