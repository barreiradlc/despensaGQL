class AddUuidToDespensa < ActiveRecord::Migration[6.0]
  def change
    add_column :despensas, :uuid, :string
  end
end
