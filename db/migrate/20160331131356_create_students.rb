class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :major
      t.string :graduation
      t.string :info

      t.timestamps null: false
    end
  end
end
