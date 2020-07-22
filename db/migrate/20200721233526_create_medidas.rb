class CreateMedidas < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredientes, :medida, :string
  end
end
