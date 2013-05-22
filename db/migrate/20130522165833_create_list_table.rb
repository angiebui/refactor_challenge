class CreateListTable < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: true
      t.timestamps 
    end
  end
end
