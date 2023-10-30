class CreateWeeklyPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_plans do |t|
      t.text :data
      t.integer :year
      t.integer :week_number

      t.timestamps
    end
  end
end
