class AddFileToStudentapplication < ActiveRecord::Migration
  def change
    add_column :studentapplications, :file, :file
  end
end
