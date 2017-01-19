class Companies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies, :options => 'COLLATE=utf8_general_ci' do |t|
      t.string :company_name
      t.string :company_location
    end
  end
end
