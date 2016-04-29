class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.datetime 'date'
    end
  end
end
