class Admin < ActiveRecord::Migration[5.0]
  def change
    create_table :admin do |t|
      t.string :firstname
      t.string :lastname
      t.string :mail

      t.timestamps
    end
  end
end
