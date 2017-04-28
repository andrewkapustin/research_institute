class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date, null: false
      t.date :finish_date, null: false
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
