class AddUsersToPedido < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :user, :string
  end

  def self.down
    add_column :pedidos, :user, :string
  end
end
