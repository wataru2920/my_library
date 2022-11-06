class ChangeBooks < ActiveRecord::Migration[5.2]
  def change
    change_table :books do |t|
      t.integer :hold
      t.remove :dl
    end
  end
end
