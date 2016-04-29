class AddResumeToStudentapplications < ActiveRecord::Migration
  def change
    add_column :studentapplications, :resume, :string
  end
end
