class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :city
      t.date :date
      t.text :message
      t.string :weather

      t.timestamps
    end
  end
end
