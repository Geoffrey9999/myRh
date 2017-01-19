class Users < ActiveRecord::Migration[5.0]
  def change
    create_table :users, :options => 'COLLATE=utf8_general_ci' do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :mail
      t.string :id_instance

      t.timestamps
    end
  end
end