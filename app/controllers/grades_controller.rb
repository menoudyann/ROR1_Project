class GradesController < ApplicationController
  before_action :set_grade, only: %i[ show edit update destroy ]

  def index
    authorize :grade, :index?
    if current_person.student?
      @grades = current_person.grades
    elsif current_person.teacher?
      @grades = Grade.all
    else
      @grades = Grade.all
    end
  end

  # GET /grades/1 or /grades/1.json
  def show
    authorize :grade, :show?
  end

  # GET /grades/new
  def new
    @grade = Grade.new
    authorize :grade, :new?
  end

  # GET /grades/1/edit
  def edit
    authorize :grade, :edit?
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)
    authorize :grade, :create?

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_url, notice: "Grade was successfully created." }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    authorize :grade, :update?
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grades_url, notice: "Grade was successfully updated." }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    @grade.destroy!
    authorize :grade, :destroy?

    respond_to do |format|
      format.html { redirect_to grades_url, notice: "Grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:person_id, :exam_id, :grade)
    end
end
