class CreateLearningModules < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_modules do |t|
      t.string :title

      t.timestamps
    end
  end
end
