class AddDespensaToConvite < ActiveRecord::Migration[6.0]
  def change
    add_reference :convites, :despensa, foreign_key: true
  end
end
