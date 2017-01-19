class Instances < ActiveRecord::Migration[5.0]
  def change
    create_table :instances, :options => 'COLLATE=utf8_general_ci' do |t|
      t.string :town
      t.string :company
      t.string :date
      t.integer :id_instance
    end
  end
end