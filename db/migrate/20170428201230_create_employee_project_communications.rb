class CreateEmployeeProjectCommunications < ActiveRecord::Migration
  def change
    create_table :employee_project_communications do |t|
      t.references :project, index: true, foreign_key: true, null: false
      t.references :employee, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
