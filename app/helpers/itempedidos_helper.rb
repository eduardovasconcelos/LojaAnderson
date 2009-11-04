module ItempedidosHelper
 def verifica_estoque
    if (produto.estoque <= 0)
      flash[:notice] = 'Quantidade do produto em estoque igual a 0'
    end
    if (produto.estoque - quantidade <= 0)
      flash[:notice] = 'Quantidade em estoque menor que a solicitada.'
    end
 end
end
