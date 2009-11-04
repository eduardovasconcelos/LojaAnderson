pdf.text "RELATÓRIO DOS PEDIDOS", :size => 30, :style => :bold
pdf.move_down(30)

pdf.text "DIÁRIO"
pdf.text "Número de Pedidos: #{dia()}"
pdf.text "Valor dos Pedidos: #{tdia().round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "SEMANAL"
pdf.text "Número de Pedidos: #{semana()}"
pdf.text "Valor dos Pedidos: #{tsemana().round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "MENSAL"
pdf.text "Número de Pedidos: #{mes()} "
pdf.text "Valor dos Pedidos: #{tmes().round(2)}"

pdf.move_down(10)
pdf.text "____________________________________________________________________________", :align => :center
pdf.move_down(10)

pdf.text "ANUAL"
pdf.text "Número de Pedidos: #{ano()}"
pdf.text "Valor dos Pedidos: #{tano().round(2)}"
