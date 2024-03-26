class PlacementsController < ApplicationController
  before_action :set_placement, only: %i[ show edit update destroy ]

  # GET /placements or /placements.json
  def index
    @placements = Placement.all
  end

  # GET /placements/1 or /placements/1.json
  def show
  end

  # GET /placements/new
  def new
    @placement = Placement.new
  end

  # GET /placements/1/edit
  def edit
  end

  # POST /placements or /placements.json
  def create
    @placement = Placement.new(placement_params)

    respond_to do |format|
      if @placement.save
        format.html { redirect_to placement_url(@placement), notice: "Placement was successfully created." }
        format.json { render :show, status: :created, location: @placement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @placement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /placements/1 or /placements/1.json
  def update
    respond_to do |format|
      if @placement.update(placement_params)
        format.html { redirect_to placement_url(@placement), notice: "Placement was successfully updated." }
        format.json { render :show, status: :ok, location: @placement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @placement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /placements/1 or /placements/1.json
  def destroy
    @placement.destroy!

    respond_to do |format|
      format.html { redirect_to placements_url, notice: "Placement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_placement
      @placement = Placement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def placement_params
      params.require(:placement).permit(:person_id, :classroom_id)
    end
end
