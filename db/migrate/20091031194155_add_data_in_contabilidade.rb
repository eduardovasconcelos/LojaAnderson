class AddDataInContabilidade < ActiveRecord::Migration
  def self.up
    add_column :contabilidades, :data_at, :date
  end

  def self.down
    remove_column :contabilidades, :data_at, :date
  end
end
