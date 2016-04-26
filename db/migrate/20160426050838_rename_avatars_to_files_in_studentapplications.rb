class RenameAvatarsToFilesInStudentapplications < ActiveRecord::Migration
  change_table :studentapplications do |t|
    t.remove :file
  end
  
  def change
    rename_column :studentapplications, :avatar, :file
  end
end
