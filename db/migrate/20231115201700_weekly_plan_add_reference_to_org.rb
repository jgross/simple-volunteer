class WeeklyPlanAddReferenceToOrg < ActiveRecord::Migration[7.0]
  def change
    add_reference(:weekly_plans,:org)
  end
end
