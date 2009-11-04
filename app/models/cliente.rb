class Cliente < ActiveRecord::Base
  
  validates_presence_of :nome, :message => "-> Nome nao pode ser nulo ou branco!"
  validates_presence_of :endereco, :message => "-> Endereco nao pode ser nulo ou branco!"
  validates_presence_of :rg, :message => "-> RG nao pode ser nulo ou branco!"
  validates_presence_of :cpf, :message => "-> CPF nao pode ser nulo ou branco!"
  validates_presence_of :telefone, :message => "-> Telefone nao pode ser nulo ou branco!"
  validates_presence_of :email, :message => "-> Email nao pode ser nulo ou branco!"

  has_many :pedidos
  after_create :null_credito

  def self.search(search)
    find(:all,
      :conditions => ["clientes.nome like :pattern || clientes.id like :pattern",
        {:pattern => "%#{search}%"}
      ])
  end

  def null_credito
    if (self.credito == " ")
      self.credito = 0.0
      self.update_attributes(:credito => self.credito)
    end
  end

  def self.find_with_pedidos_in_date_range(id, start_date, end_date)
    conditions="pedidos.cliente_id =? and pedidos.data_pedido between ? and ?"
    cliente_details_with_pedidos = self.find(:all, :include => 'pedidos',:conditions=> [conditions,id,start_date,end_date], :order=>'data_pedido asc')
    return cliente_details_with_pedidos
  end

end
