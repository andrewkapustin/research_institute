class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false, limit: 64

      t.index [:name], unique: true

      t.timestamps null: false
    end
  end
end
