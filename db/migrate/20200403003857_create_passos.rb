class CreatePassos < ActiveRecord::Migration[6.0]
  def change
    create_table :passos do |t|
      t.string :descricao
      t.string :posicao
      t.references :receitum, null: true, foreign_key: true

      t.timestamps
    end
  end
end
