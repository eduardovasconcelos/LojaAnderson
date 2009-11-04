pdf.text "PEDIDOS DO PRODUTO", :size => 30, :style => :bold
pdf.move_down(30)
pdf.text "ID do Produto: #{@produto.id}"
pdf.text "Nome do Produto: #{@produto.nome}"
pdf.text "Valor Unitário do Produto: #{@produto.valor}"
pdf.move_down(20)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)
pdf.text "DIÁRIO"
pdf.text "Número de Pedidos: #{venda_produto_dia(@produto.id)}"
pdf.text "Quantidade Vendida: #{quantidade_produto_tdia(@produto.id)}"
pdf.text "Valor dos Pedidos: R$ #{venda_produto_tdia(@produto.id).round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "SEMANAL"
pdf.text "Número de Pedidos: #{venda_produto_semana(@produto.id)}"
pdf.text "Quantidade Vendida: #{quantidade_produto_tsemana(@produto.id)}"
pdf.text "Valor dos Pedidos: R$ #{venda_produto_tsemana(@produto.id).round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "MENSAL"
pdf.text "Número de Pedidos: #{venda_produto_mes(@produto.id)} "
pdf.text "Quantidade Vendida: #{quantidade_produto_tmes(@produto.id)}"
pdf.text "Valor dos Pedidos: R$ #{venda_produto_tmes(@produto.id).round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "ANUAL"
pdf.text "Número de Pedidos: #{venda_produto_ano(@produto.id)}"
pdf.text "Quantidade Vendida: #{quantidade_produto_tano(@produto.id)}"
pdf.text "Valor dos Pedidos: R$ #{venda_produto_tano(@produto.id).round(2)}"
