class CreateSolutions < ActiveRecord::Migration
  def change
    ["abc", "def", "xyz"].each do |customer|
      create_table "#{customer}_solutions".to_sym do |t|
        t.string :explanation
        t.integer :problem_id
        t.timestamps
      end
    end
  end
end
