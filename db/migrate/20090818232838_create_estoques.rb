class CreateEstoques < ActiveRecord::Migration
  def self.up
    create_table :estoques do |t|
      t.integer :pra
      t.integer :fila

      t.timestamps
    end
  end

  def self.down
    drop_table :estoques
  end
end
