class DeleteAvatarFromUsers < ActiveRecord::Migration
  change_table :users do |t|
    t.remove :avatar
  end
  
end
