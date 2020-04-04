class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.references :user, null: true, foreign_key: true
      t.references :provimento, null: true, foreign_key: true
      t.references :despensa, null: true, foreign_key: true

      t.integer :quantidade
      t.date :validade

      t.timestamps
    end
  end
end
