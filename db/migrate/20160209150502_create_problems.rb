class CreateProblems < ActiveRecord::Migration
  def change
    ["abc", "def", "xyz"].each do |customer|
      create_table "#{customer}_problems".to_sym do |t|
        t.string :title
        t.integer :severity
        t.text :description
        t.datetime :discovered_on

        t.timestamps
      end
    end
  end
end
