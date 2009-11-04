class AddValroitem < ActiveRecord::Migration
  def self.up
    add_column :itempedidos, :valor_item, :float
  end

  def self.down
    remove_column :itempedidos, :valor_item, :float
  end
end
