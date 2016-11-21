#make a selection
require './lib/checkout'
require './lib/text'


class TakeAway
  attr_reader :my_order
  def initialize(checkout_klass = Checkout, text_klass = Text)
    @menu = {burger: 10,  salad: 5, drink: 2}
    @checkout = checkout_klass
    @text = text_klass
    @my_order = {}
  end

  def read_menu
    @menu.each { |k,v|  " #{k} for #{v} pounds. "}
  end

  def add(dish, dish_portions = 1)
    dish = dish.to_sym
    dish_price = @menu[dish]
    @my_order[dish] = {portions: 0, price: dish_price } if not @my_order[dish]
    @my_order[dish][:portions] += dish_portions
    @my_order
    #order.add(dish, dish_portions = 1)
  end

  def confirm_order
    new_order = @checkout.new(@my_order)
    new_order.confirm
  end

  def place_order
      confirm_order
      confirmation_text
  end



private

  def confirmation_text
    @text.new.send
  end

end
