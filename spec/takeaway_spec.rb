require 'takeaway'

describe TakeAway do
  let(:checkout) {double :checkout}

  before {allow(checkout).to receive(:new)}
  before { allow(checkout).to receive(:confirm) }



  subject(:takeaway) {described_class.new(checkout)}



  context "when selecting the dishes" do

    it "read the options" do
      expect(takeaway.read_menu).to eq( {:burger=>10, :salad=>5, :drink=>2})
    end


    it "order 1 portion of burger from the takeaway and save it in my order array" do

      expect(takeaway.add(:burger, 1)).to eq({:burger=>{:portions=>1, :price=>10}})
    end

    it "order 2 portions of burger and save it in my order array" do

      expect(takeaway.add(:burger, 2)).to eq({:burger=>{:portions=>2, :price=>10}})
    end


  end

    it "should send a text when we place the order" do

      allow(takeaway).to receive(:confirm_order)
      allow(takeaway).to receive(:confirmation_text).and_return("Message sent")
      expect(takeaway.place_order).to eq "Message sent"
    end

    it "confirms the total and content of the order" do
      takeaway.add(:burger, 2)
      allow(checkout).to receive(:confirm).and_return(20)
      expect(takeaway.confirm_order).to eq 20
    end
end
