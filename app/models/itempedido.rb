class Itempedido < ActiveRecord::Base

  #Relacionamentos
  belongs_to :produto
  belongs_to :pedido

  #Validações
  validates_numericality_of :quantidade, :only_integer => true, :greater_than => 0, :message => "-> A quantidade somente pode ser número inteiro positivo!"
  validates_numericality_of :produto_id, :only_integer => true, :greater_than => 0, :message => "-> A quantidade somente pode ser número inteiro positivo!"
  validates_presence_of :quantidade, :message => "-> O Campo não pode ser nulo ou branco!"
  validates_presence_of :produto_id, :message => "-> O Campo não pode ser nulo ou branco!"

  attr_accessor :should_destroy

  #Salvando o valor atual do produto
  after_create :cadastra_valor, :soma_valor, :debita_estoque

  def produto_nome
    produto.nome if produto
  end

  def produto_nome=(nome)
    self.produto = Produto.find_by_nome(nome) unless nome.blank?
  end

  def grava_itempedido
    busca = Pessoa.find(:first, :conditions => ['nome = ?', @nome, @mae, @data_nascimento])
    if busca.nil?
      p = Pessoa.new
      p.email = @email_pessoa
      p.nis = @nis
      p.save
      self.pessoa_id = p.id
      @pessoa_id = p.id
      save_telefones
    else
      busca.update_attributes(
        :nome => @nome,
        :email => @email,
        :nis => @nis )
      save_telefones
    end
  end

  def should_destroy?
    should_destroy.to_i == 1
  end
  
  #Passando o valor total do item no pedido. => valor_item => quantidade * valor_unitario
  def soma_valor
    self.update_attributes(:valor_item => (self.quantidade * self.valor))
  end

  #Debita no estoque a quantidade pedida
  def debita_estoque
    produto.update_attributes(:estoque => (produto.estoque - self.quantidade))
  end

  def cadastra_valor
    self.update_attributes(:valor => produto.valor)
  end

  def after_validation_on_update
    self.update_attribute(:valor, produto.valor)
    new_valor_item = (self.valor * self.quantidade)
    self.update_attribute(:valor_item, new_valor_item)
  end
end