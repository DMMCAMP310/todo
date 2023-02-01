class DosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal
  before_action :set_do, only: [:show, :edit, :update, :destroy, :sort]

  # GET /dos/new
  def new
    @do = @goal.dos.new
  end

  # GET /dos/1/edit
  def edit
  end


  def sort
  end
  # POST /dos
  def create
    @do = @goal.dos.new(do_params)

    if @do.save
      @status = true
    else
      @status = false
    end
  end

  # PATCH/PUT /dos/1
  def update
    if @do.update(do_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /dos/1
  def destroy
    @do.destroy
  end

  private
  
    def set_goal
      @goal = current_user.goals.find_by(id: params[:goal_id])
      redirect_to(goals_url, alert: "ERROR!!") if @goal.blank?
    end
    
    def set_do
      @do = @goal.dos.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def do_params
      params.require(:do).permit(:content, :goal_id, :position, :done)
    end
end
