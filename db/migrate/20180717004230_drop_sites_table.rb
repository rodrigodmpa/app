class DropSitesTable < ActiveRecord::Migration[5.2]
    def up
      drop_table :sites
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
