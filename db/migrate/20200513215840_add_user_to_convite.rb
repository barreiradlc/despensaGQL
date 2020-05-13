class AddUserToConvite < ActiveRecord::Migration[6.0]
  def change
    add_reference :convites, :user, foreign_key: true
  end
end
