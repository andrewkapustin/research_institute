class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false, limit: 30
      t.date :start_date, null: false
      t.date :finish_date, null: false
      t.float :price, null: false

      t.index [:name, :start_date, :finish_date], unique: true

      t.timestamps null: false
    end
  end
end
