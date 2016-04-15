class AddMessageToStudentapplications < ActiveRecord::Migration
  def change
    add_column :studentapplications, :message, :string
  end
end
