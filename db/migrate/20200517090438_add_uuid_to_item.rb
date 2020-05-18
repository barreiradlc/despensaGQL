class AddUuidToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :uuid, :string
  end
end
