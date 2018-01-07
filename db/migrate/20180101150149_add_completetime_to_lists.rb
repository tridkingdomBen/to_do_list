class AddCompletetimeToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :completed_at, :datetime
  end
end
