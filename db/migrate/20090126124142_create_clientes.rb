class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nome
      t.string :endereco
      t.string :cpf
      t.string :rg
      t.string :telefone
      t.string :transportadora
      t.string :end_cobranca
      t.float :credito

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
