class CreateDespensas < ActiveRecord::Migration[6.0]
  def change
    create_table :despensas do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
