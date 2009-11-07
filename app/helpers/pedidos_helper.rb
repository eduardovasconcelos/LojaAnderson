module PedidosHelper
  #Action de criacao do novo item do pedido
  def novo_item_link()
    link_to_remote "Adicionar Item", :update => "items", :url => {:action => "adicionar_item"}, :with => "'nome_produto='+$('produto_nome').value&'quantidade'=+$('quantidade').value"
  end

  def link_to_remove_item(item)
    link_to_remote "remover", :url => {:action => "remover_item", :id => item.id }, :update => "items"
  end
end