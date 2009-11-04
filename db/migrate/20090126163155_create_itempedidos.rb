class CreateItempedidos < ActiveRecord::Migration
  def self.up
    create_table :itempedidos do |t|
      t.references :produto
      t.references :pedido
      t.integer :quantidade
      t.timestamps
    end
  end

  def self.down
    drop_table :itempedidos
  end
end
