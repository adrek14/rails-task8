class Cart < Order

  default_scope :conditions => { :confirmation => false }

  def add_item( n, prod )
      if ( @item = Item.where( "product_id = ? AND order_id = ?", prod.id, self.id ) ) != []
          @item.first.quantity += 1
          @item.first.save
      else
          @item = Item.new( :product => prod, :order => self, :quantity => 1 )
          @item.save
      end
  end

  def rm_item( prod )
      if ( @item = Item.where( "product_id = ? AND cart_id = ?", prod.id, self.id ) ) != []
          @item.first.quantity -= 1
          if @item.first.quantity == 0
              Item.delete( @item.first.id )
          else
          @item.first.save
          end
      end
  end


end
