module PedidosHelper

 #Action de criacao do novo item do pedido
 def novo_item_link(name)
   link_to_function name do |page|
    page.insert_html :bottom, :items, :partial => 'item', :object => Itempedido.new
   end
 end



end
