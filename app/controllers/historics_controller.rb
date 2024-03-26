class HistoricsController < ApplicationController
  before_action :set_historic, only: %i[ show edit update destroy ]

  # GET /historics or /historics.json
  def index
    @historics = Historic.all
  end

  # GET /historics/1 or /historics/1.json
  def show
  end

  # GET /historics/new
  def new
    @historic = Historic.new
  end

  # GET /historics/1/edit
  def edit
  end

  # POST /historics or /historics.json
  def create
    @historic = Historic.new(historic_params)

    respond_to do |format|
      if @historic.save
        format.html { redirect_to historic_url(@historic), notice: "Historic was successfully created." }
        format.json { render :show, status: :created, location: @historic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @historic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historics/1 or /historics/1.json
  def update
    respond_to do |format|
      if @historic.update(historic_params)
        format.html { redirect_to historic_url(@historic), notice: "Historic was successfully updated." }
        format.json { render :show, status: :ok, location: @historic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @historic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historics/1 or /historics/1.json
  def destroy
    @historic.destroy!

    respond_to do |format|
      format.html { redirect_to historics_url, notice: "Historic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historic
      @historic = Historic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historic_params
      params.require(:historic).permit(:student_first_name, :student_last_name, :exam_date, :exam_title, :grade, :semester, :year)
    end
end
