class IsAdmin < ActiveRecord::Migration[5.0]
  def change
    create_table :admins, :options => 'COLLATE=utf8_general_ci' do |t|
      t.string :login
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :mail
      t.string :password_digest

      t.timestamps
    end
  end
end
