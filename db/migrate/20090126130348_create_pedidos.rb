class CreatePedidos < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.references :cliente
      t.date :data_pedido
      t.date :data_entrega
      t.float :valor_total

      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos
  end
end
