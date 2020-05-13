class RemoveUserSolicitacaoFromConvite < ActiveRecord::Migration[6.0]
  def change
    remove_column :convites, :usuario_destino, :integer
    remove_column :convites, :usuario_solicitacao, :integer
    remove_column :convites, :mensagem_cancelamento, :string
  end
end
