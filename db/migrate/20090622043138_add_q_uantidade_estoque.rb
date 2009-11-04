class AddQUantidadeEstoque < ActiveRecord::Migration
  def self.up
    add_column :produtos, :estoque, :integer
  end

  def self.down
    remove_column :produtos, :estoque, :integer
  end
end
