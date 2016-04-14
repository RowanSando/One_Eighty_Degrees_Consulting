class AssociateStudentapplicationsToUser < ActiveRecord::Migration
  change_table :studentapplications do |t|
    t.remove :name, :email
    t.belongs_to :user, index: true
  end
  
end
