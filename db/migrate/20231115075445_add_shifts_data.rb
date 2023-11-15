class AddShiftsData < ActiveRecord::Migration[7.0]
  def change
    add_column(:weekly_plans,:shift_data,:text)
  end
end
