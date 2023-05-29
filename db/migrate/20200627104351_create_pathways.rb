class CreatePathways < ActiveRecord::Migration[6.1]
  def change
    create_table :pathways do |t|
      t.string :subject
      t.string :content
    end
  end
end
