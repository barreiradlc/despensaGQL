class AddDeletedAtToItemAndDespensa < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :deleted_at, :datetime
    add_column :despensas, :deleted_at, :datetime
  end
end
