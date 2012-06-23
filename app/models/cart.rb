class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy


  # This functionality will check if a product being added to the cart already exists in the cart and if there will
  # increment the quantity, otherwise will add a new line item
  def add_product(product)
    current_item = line_items.where(:product_id => product.id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id => product_id)
      line_items << current_item
    end
    current_item
  end
end
