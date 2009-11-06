module PedidosHelper

 #Action de criacao do novo item do pedido
 def novo_item_link()
   link_to_remote "Adicionar Item", :update => "items", :url => {:action => "adicionar_item"}
    #page.insert_html :bottom, :items, :partial => 'item', :object => Itempedido.new
   #end
 end



end
