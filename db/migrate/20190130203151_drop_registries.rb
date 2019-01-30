class DropRegistries < ActiveRecord::Migration[5.2]
  def up
    drop_table :registries
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
