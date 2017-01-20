class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions, :options => 'COLLATE=utf8_general_ci' do |t|
      t.text :template

      t.timestamps
    end
  end
end
