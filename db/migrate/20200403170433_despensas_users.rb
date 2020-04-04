class DespensasUsers < ActiveRecord::Migration[6.0]
  def change

    create_table :despensas_users, id: false do |t|
      t.references :user , :despensa
    end

  end
end
