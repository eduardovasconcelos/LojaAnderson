# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

require 'fusioncharts_helper'
include FusionChartsHelper

  #Action responsável pela procura de algum campo específico
  def search(search_url)
    render(:partial => "shared/search" ,
    :locals => {
      :search_url => search_url
    })
  end

 

  #Action responsável pela soma dos pedidos no dia
  def dia
    Pedido.count(:id, :conditions => 'data_pedido=curdate()')
  end

  #Action responsável pela soma dos valores do pedidos no dia
  def tdia
    Pedido.sum(:valor_total, :conditions => 'data_pedido=curdate()')
  end

  #Action responsável pela soma dos pedidos no mes
  def mes
    Pedido.count(:id, :conditions => 'MONTH(data_pedido)=MONTH(curdate())')
  end

  #Action responsável pela soma dos valores dos pedidos no mes
  def tmes
    Pedido.sum(:valor_total, :conditions => 'MONTH(data_pedido)=MONTH(curdate())')
  end

  #Action responsável pela soma dos pedidos no ano
  def ano
    Pedido.count(:id, :conditions => 'YEAR(data_pedido)=YEAR(curdate())')
  end

  #Action responsável pela soma dos valores dos pedidos no ano
  def tano
    Pedido.sum(:valor_total, :conditions => 'YEAR(data_pedido)=YEAR(curdate())')
  end

  #Action responsável pela soma dos pedidos semanais
  def semana
    Pedido.count(:id, :conditions => 'DAY(data_pedido)>=DAY(curdate())-7 and MONTH(data_pedido)=MONTH(curdate())')
  end

  #Action responsável pela soma dos valores dos pedidos semanais
  def tsemana
    Pedido.sum(:valor_total, :conditions => 'DAY(data_pedido)>=DAY(curdate())-7 and MONTH(data_pedido)=MONTH(curdate())')
  end

  #Action responsável pela soma da quantidade de vezes que o item foi pedido no dia
  def venda_produto_dia(prod)
    Itempedido.count(:produto_id, :conditions => ['DAY(created_at)=DAY(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma do valor do item no dia
  def venda_produto_tdia(prod)
    Itempedido.sum(:valor_item, :conditions => ['DAY(created_at)=DAY(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma da quantidade de vezes que o item foi pedido no mes
  def venda_produto_mes(prod)
    Itempedido.count(:produto_id, :conditions => ['MONTH(created_at)=MONTH(curdate()) and produto_id = ?', prod])
  end

#Action responsável pela soma do valor do item no mes
  def venda_produto_tmes(prod)
    Itempedido.sum(:valor_item, :conditions => ['MONTH(created_at)=MONTH(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma da quantidade de vezes que o item foi pedido no ano
  def venda_produto_ano(prod)
    Itempedido.count(:produto_id, :conditions => ['YEAR(created_at)=YEAR(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma do valor do item no ano
  def venda_produto_tano(prod)
    Itempedido.sum(:valor_item, :conditions => ['YEAR(created_at)=YEAR(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma da quantidade de vezes que o item foi pedido na semana
  def venda_produto_semana(prod)
    Itempedido.count(:produto_id, :conditions => ['DAY(created_at)>=DAY(curdate())-7 and MONTH(created_at)=MONTH(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma do valor do item na semana
  def venda_produto_tsemana(prod)
    Itempedido.sum(:valor_item, :conditions => ['DAY(created_at)>=DAY(curdate())-7 and MONTH(created_at)=MONTH(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma da quantidade vendida do item na dia
  def quantidade_produto_tdia(prod)
    Itempedido.sum(:quantidade, :conditions => ['DAY(created_at)=DAY(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma da quantidade vendida do item na semana
  def quantidade_produto_tsemana(prod)
    Itempedido.sum(:quantidade, :conditions => ['DAY(created_at)>=DAY(curdate())-7 and MONTH(created_at)=MONTH(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma da quantidade vendida do item no mes
  def quantidade_produto_tmes(prod)
    Itempedido.sum(:quantidade, :conditions => ['MONTH(created_at)=MONTH(curdate()) and produto_id = ?', prod])
  end

  #Action responsável pela soma da quantidade vendida do item no ano
  def quantidade_produto_tano(prod)
    Itempedido.sum(:quantidade, :conditions => ['YEAR(created_at)=YEAR(curdate()) and produto_id = ?', prod])
  end

 
end