class CreateContabilidades < ActiveRecord::Migration
  def self.up
    create_table :contabilidades do |t|
      t.string :descricao
      t.string :tipo
      t.float :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :contabilidades
  end
end
