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

# Clases para los descuentos
# ==========================
# Clase para obtener el precio con el descuento 2x1
class DiscountTwoForOne
  # Se divide entre 2 y se suma 1 si es impar
  def total(quantity, price)
    (quantity % 2 + (quantity / 2)) * price
  end
end
# Clase para obtener el precio con el descuento 3+
class DiscountThreeOrMore
  # Inicializo porque esta promo tiene un nuevo precio
  def initialize(new_price)
    @new_price = new_price
  end
  # Si el numero de items es >= 3 entonces se aplica el nuevo precio al item
  def total(quantity, price)
    if quantity >= 3 then
      price = @new_price
    end
    quantity * price
  end
end
# Clase para obtener el precio sin aplicar descuento
class DiscountNull
  # Si no hay descuento el precio no se modifica
  # y el total es igual al precio del item por la cantidad de items
  def total(quantity,price)
    quantity * price
  end
end

# Clase para las reglas de descuento a aplicar
# ============================================
class PricingRules
  # Inicializo la regla con el item al que quiero aplicar la regla
  # y el discount que le voy a aplicar a ese item
   def initialize(item, discount)
     @item = item
     @discount = discount
   end
   # Obtengo el código del item para buscarlo en la lista de items
   # y encontrar las coincidencias con los descuentos
   def item_code
     @item.code
   end
   # Obtengo el precio total del descuento para la cantidad de items que haya
   # y para el precio normal de ese item
   def total(quantity)
     @discount.total(quantity, @item.price)
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
