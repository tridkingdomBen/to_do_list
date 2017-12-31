class CreateDatepickers < ActiveRecord::Migration[5.1]
  def change
    create_table :datepickers do |t|

      t.timestamps
    end
  end
end
