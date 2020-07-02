class CreateTemperatures < ActiveRecord::Migration[6.0]
  def change
    create_table :temperatures do |t|

      t.timestamps
    end
  end
end
