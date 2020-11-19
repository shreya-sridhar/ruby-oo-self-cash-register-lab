class CashRegister

    attr_reader :total, :discount, :items

    def initialize(discount=0)
        @total=0
        @discount=discount
        @items = []
    end

    def total=(total)
        @total=total
    end

    def add_item(title,price,quantity=1)
        @old_total = @total
        @total += price*quantity
        quantity.times{@items<<title}
        @last_transaction = [title, price, quantity]
    end

    def apply_discount
        @total -=(@total*@discount)/100
        @discount ==0? "There is no discount to apply.": "After the discount, the total comes to $#{@total}."
    end

    def items
        @items 
    end

    def void_last_transaction
        @total -= @last_transaction[1] * @last_transaction[2]
    end


end
