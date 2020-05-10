class CreateConvites < ActiveRecord::Migration[6.0]
  def change
    create_table :convites do |t|
      t.string :mensagem
      t.string :mensagem_cancelamento
      
      t.integer :usuario_destino
      t.integer :usuario_solicitacao


      t.timestamps
    end
  end
end
