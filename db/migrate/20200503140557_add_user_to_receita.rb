class AddUserToReceita < ActiveRecord::Migration[6.0]
  def change
    add_reference :receita, :user, foreign_key: true
  end
end
