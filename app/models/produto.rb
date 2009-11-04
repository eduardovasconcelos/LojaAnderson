class Produto < ActiveRecord::Base

  #Validações
  validates_numericality_of :estoque, :only_integer => true, :greater_than => 0, :message => "-> O campo quantidade somente pode ser inteiro positivo!"
  validates_numericality_of :valor, :greater_than => 0, :message => "-> O valor deve ser um número positivo!"
  validates_presence_of :nome, :message => "-> O Campo não pode ser nulo ou branco!"
  validates_presence_of :estoque, :message => "-> O Campo não pode ser nulo ou branco!"

  #Relacionamentos
  has_many :itempedidos

end
