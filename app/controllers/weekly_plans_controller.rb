class WeeklyPlansController < ApplicationController
  before_action :set_org 
  before_action :set_weekly_plan, only: %i[settings show edit update destroy ]
  
  # GET /weekly_plans or /weekly_plans.json
  def index
    redirect_to "/orgs/#{params[:org_id]}/weekly_plans/#{Date.today.year}-#{Date.today.cweek}"
  end

  # GET /weekly_plans/1 or /weekly_plans/1.json
  def show
  end

  # GET /weekly_plans/new
  def new
    @weekly_plan = WeeklyPlan.new
  end


  def settings
    
  end 

  # PATCH/PUT /weekly_plans/1 or /weekly_plans/1.json
  def update
    respond_to do |format|
      if @weekly_plan.update(weekly_plan_params)
        format.html { redirect_to org_weekly_plan_url(@org,@weekly_plan), notice: "Weekly plan was successfully updated." }
        format.json { render :show, status: :ok, location: @weekly_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weekly_plan.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_plan
      if params[:id].to_s.include?("-")
        year, week_number = params[:id].split("-")
        @weekly_plan = @org.weekly_plans.where(week_number: week_number, year: year).first_or_create
      else 
        @weekly_plan = @org.weekly_plans.find_by_id(params[:id])
      end 
    end

    def set_org
      @org = Org.find(params[:org_id])
    end 
    # Only allow a list of trusted parameters through.
    def weekly_plan_params
      params.require(:weekly_plan).permit(:org_id,:first_shift_manager,:second_shift_manager, :year,:first_shift_time,:first_shift_number_of_volunteers,:second_shift_time,:second_shift_number_of_volunteers, :week_number,data: [])
    end
end
