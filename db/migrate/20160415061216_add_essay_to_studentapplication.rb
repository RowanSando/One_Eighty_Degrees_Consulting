class AddEssayToStudentapplication < ActiveRecord::Migration
  def change
    add_column :studentapplications, :essay, :string
  end
  
  change_table :studentapplications do |t|
    t.remove :name
  end
end
