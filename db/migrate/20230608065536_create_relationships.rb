class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.references :source, polymorphic: true, null: false
      t.references :dest, polymorphic: true, null: false

      t.timestamps
    end

    add_index :relationships, [:source_type, :source_id, :dest_type, :dest_id], unique: true, name: 'index_relationships_on_source_and_dest'
  end
end
