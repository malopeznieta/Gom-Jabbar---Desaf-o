# Clase Item
# ==========
class Item
  # No incluyo el nombre porque no es necesario para hacer la lógica
  attr_accessor :code, :price
  def initialize(code,price)
    @code = code
    @price = price
  end
end

class Cart
  def initialize(pricing_rules = nil)
  end

  def add(code)
  end

  def total
    0
  end
end
