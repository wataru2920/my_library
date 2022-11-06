class AddFlagToReserves < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :flag, :integer
  end
end
