class CreateIngredientes < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredientes do |t|
      
      t.references :receitum, null: true, foreign_key: true
      t.references :provimento, null: true, foreign_key: true

      t.integer :quantidade
      t.timestamps

    end
  end
end
