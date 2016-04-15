class AddResumeToStudentapplication < ActiveRecord::Migration
  def change
    add_column :studentapplications, :resume, :file
  end
end
