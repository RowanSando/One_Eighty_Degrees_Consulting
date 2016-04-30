class AddEssayToStudentapplications < ActiveRecord::Migration
  def change
    add_column :studentapplications, :essay, :string, array: true, default: []
  end
end
