class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :email
      t.string :info

      t.timestamps null: false
    end
  end
end

