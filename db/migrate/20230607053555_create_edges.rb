class CreateEdges < ActiveRecord::Migration[7.0]
  def change
    create_table :edges do |t|
      t.references :source, foreign_key: { to_table: :recordings }, index: true, null: false
      t.references :dest, foreign_key: { to_table: :recordings }, index: true, null: false

      t.timestamps
     end
  end
end

# class CreateEdges < ActiveRecord::Migration[7.0]
#   def change
      # create_table :edges, id: false do |t|
      #   t.integer :source, null: false
      #   t.integer :dest, null: false

      #   t.timestamps
      # end

      # add_foreign_key :edges, :recordings, column: :source
      # add_foreign_key :edges, :recordings, column: :dest
      # add_index :edges, [:source, :dest], unique: true
#   end
# end
