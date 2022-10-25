class CashRegister
   attr_accessor :discount, :total, :items, :last_item
    
   def initialize(discount = 0, total = 0, items=[])
        @discount = discount
        @total = total
        @items = items
    end
    def add_item(title, price, quantity=1)
       self.last_item = price * quantity
       self.total += self.last_item
       quantity.times { @items << title }
    end
    def apply_discount
        if self.discount > 0
            percent_discount = self.discount/100.0
            self.total = self.total - (self.total * percent_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
       removed_item = @items.pop(1)
       self.total -= self.last_item
    end
end

