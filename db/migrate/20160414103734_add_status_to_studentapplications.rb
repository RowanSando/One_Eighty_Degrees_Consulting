class AddStatusToStudentapplications < ActiveRecord::Migration
  def change
    add_column :studentapplications, :status, :string
  end
end
