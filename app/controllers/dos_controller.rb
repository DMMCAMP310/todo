class DosController < ApplicationController
  before_action :set_do, only: [:show, :edit, :update, :destroy]

  # GET /dos
  def index
    @dos = Do.all
  end

  # GET /dos/1
  def show
  end

  # GET /dos/new
  def new
    @do = Do.new
  end

  # GET /dos/1/edit
  def edit
  end

  # POST /dos
  def create
    @do = Do.new(do_params)

    if @do.save
      redirect_to @do, notice: 'Do was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dos/1
  def update
    if @do.update(do_params)
      redirect_to @do, notice: 'Do was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dos/1
  def destroy
    @do.destroy
    redirect_to dos_url, notice: 'Do was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_do
      @do = Do.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def do_params
      params.require(:do).permit(:content, :goal_id, :position, :done)
    end
end
