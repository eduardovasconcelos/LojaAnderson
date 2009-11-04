xml = Builder::XmlMarkup.new(:indent=>0)
options = {
 :caption=>'Gastos do Cliente',
 :subcaption=>'Cliente '+ @cliente_details_with_pedidos.nome,
 :yAxisName=>'Valor do Pedido',
 :xAxisName=>'Dia',
 :showValues=>'1',
 :formatNumberScale=>'0',
 :numberSuffix=>' reais'
}
xml.graph(options) do
  for pedido in @cliente_details_with_pedidos.pedidos do
     data_pedido = pedido.data_pedido.strftime("%d/%m/%Y")
     xml.set(:name=>data_pedido,:value=>pedido.valor_total,:color=>'blue')
  end
end