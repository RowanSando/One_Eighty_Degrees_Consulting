class RemoveEssayFromStudentapplications < ActiveRecord::Migration
  def change
    remove_column :studentapplications, :essay, :string
  end
end
