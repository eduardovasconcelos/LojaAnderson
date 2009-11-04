pdf.text "RELATÓRIO DOS PEDIDOS DO PEDIDO", :size => 30, :style => :bold
pdf.move_down(30)
pdf.text "Produto ID: #{produto.id}"
pdf.text "Produto Nome: #{produto.nome}"
pdf.text "DIÁRIO"
pdf.text "Número de Pedidos: #{venda_produto_dia()}"
pdf.text "Valor dos Pedidos: #{venda_produto_tdia().round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "SEMANAL"
pdf.text "Número de Pedidos: #{venda_produto_semana()}"
pdf.text "Valor dos Pedidos: #{venda_produto_tsemana().round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "MENSAL"
pdf.text "Número de Pedidos: #{venda_produto_mes()} "
pdf.text "Valor dos Pedidos: #{venda_produto_tmes().round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "ANUAL"
pdf.text "Número de Pedidos: #{venda_produto_ano()}"
pdf.text "Valor dos Pedidos: #{venda_produto_tano().round(2)}"
