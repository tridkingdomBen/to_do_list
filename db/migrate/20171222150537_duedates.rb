class Duedates < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :duedate, :date
  end
end
