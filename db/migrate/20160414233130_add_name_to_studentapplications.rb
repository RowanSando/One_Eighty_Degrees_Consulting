class AddNameToStudentapplications < ActiveRecord::Migration
  def change
    add_column :studentapplications, :name, :string
  end
end
