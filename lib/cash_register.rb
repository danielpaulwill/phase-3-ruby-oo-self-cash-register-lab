require "pry"

class CashRegister
  attr_accessor :discount, :total, :quantity, :items, :last_transaction

  def initialize discount = 0
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item title, price, quantity = 1
    @title = title
    @total = @total + (quantity * price)
    @last_transaction = [title, price, quantity]
    i = quantity
    loop do
      i = i - 1
      @items << title
      if i == 0
        break
      end
    end
  end

  def apply_discount
    if @discount != 0
      @total = @total * ((100.0 - @discount) / (100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    else "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    if @last_transaction[2] == 1
      @total = @total - @last_transaction[1]
    else 
      @total = @total - (@last_transaction[1] * @last_transaction[2])
    end
  end

end
