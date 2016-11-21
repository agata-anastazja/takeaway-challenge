require "checkout"
#returns the order and total amount
describe Checkout do

  first_checkout = {:burger=>{:portions=>1, :price=>10}}
  second_checkout = {:burger=>{:portions=>2, :price=>10}, :salad=>{:portions=>2, :price=>5}}

  subject(:checkout1) {described_class.new(first_checkout)}
  subject(:checkout2) {described_class.new(second_checkout)}




  it " confirms the basket and total" do
      expect(checkout1.confirm).to eq 10
  end

  it "confirms the the basket and total when ordering two dishes" do
      expect(checkout2.confirm).to eq 30
  end
end
