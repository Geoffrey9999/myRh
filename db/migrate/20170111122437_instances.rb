class Instances < ActiveRecord::Migration[5.0]
  def change
    create_table :instances do |t|
      t.string :town
      t.string :company
      t.string :date
    end
  end
end