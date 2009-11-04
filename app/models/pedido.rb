class Pedido < ActiveRecord::Base
  
  #  Validaçoes
  validates_numericality_of :cliente_id, :only_integer => true, :greater_than => 0, :message => "-> O ID do cliente somente pode ser inteiro!"

  #Relacionamentos
  belongs_to :cliente
  has_many :itempedidos

  #Callbacks
  after_update :save_itempedidos
  after_create :calcular_total

  validates_associated :save_itempedidos

 
  def self.search(search)
    find(:all,
      :include => :cliente,
      :conditions => ["clientes.nome like :pattern || clientes.id like :pattern",
        {:pattern => "%#{search}%"}
      ])
  end


  def item_attributes=(item_attributes)
    item_attributes.each do |attributes|
      if attributes[:id].blank?
        itempedidos.build(attributes)
      else
        item = itempedidos.detect { |t| t.id == attributes[:id].to_i  }
        item.attributes = attributes
      end
    end
  end

  def save_itempedidos
    itempedidos.each do |item|
      if item.should_destroy?
        item.destroy
      else
        item.save(false)
      end
    end
  end
  
  def calcular_total
    total = 0.0
    itempedidos.each do |item|
      total += item[:valor_item].to_f
    end
    self.valor_total = total
    self.update_attributes(:valor_total => self.valor_total)
    return self.valor_total
  end

end
