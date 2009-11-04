pdf.text "Pedido Numero: #{@pedido.id}", :size => 20, :style => :bold
pdf.move_down(20)

pdf.text "Dados do Cliente", :size => 15, :style => :bold
pdf.text "Cliente: #{@pedido.cliente.nome}"
pdf.text "Endereco do Cliente: #{@pedido.cliente.endereco}"
pdf.text "Telefone: #{@pedido.cliente.telefone}"
pdf.text "Email: #{@pedido.cliente.email}"

pdf.move_down(20)
pdf.text "Dados do Pedido", :size => 15, :style => :bold
pdf.text "Funcionário Responsável #{@pedido.user}"
pdf.text "Data do Pedido #{@pedido.data_pedido.strftime("%d/%m/%Y")}"
pdf.text "Data da Entrega: #{@pedido.data_entrega.strftime("%d/%m/%Y")}"
pdf.text "Endereço da Entrega: #{@pedido.cliente.end_cobranca}"

pdf.move_down(20)
pdf.text "Itens do Pedido", :size => 15, :style => :bold
items = @pedido.itempedidos.map do |item|
[
    item.produto.nome,
    item.quantidade,
    item.valor,
    item.valor_item
]
end

pdf.table items, :border_style => :grid,
    :row_colors => ["FFFFFF","DDDDDD"],
    :headers => ["Produto", "Quantidade","Preco Unitario","Preco Total"],
    :align => {0 => :left, 1 => :right, 2 => :right, 3 => :right}

pdf.move_down(10)
pdf.text "Valor Total: R$ #{@pedido.valor_total }", :size => 20, :style => :bold

pdf.move_down(30)
pdf.text "Itatiba, SP, #{Time.now.strftime("%d/%m/%Y")}."

pdf.move_down(50)
pdf.text "_____________________________        _____________________________"
pdf.text "   FUNCIONÁRIO RESPONSÁVEL                                CLIENTE           "