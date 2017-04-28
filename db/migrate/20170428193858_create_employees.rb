class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :last_name,  null: false, limit: 20
      t.string :first_name, null: false, limit: 20
      t.string :patronymic, limit: 20
      t.string :passport, null: false, unique: true
      t.string :itn, null: false, unique: true
      t.date :date_of_birth, null: false
      t.string :post, null: false, limit: 30
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
