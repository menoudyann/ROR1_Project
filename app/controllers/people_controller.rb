class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # Check if the user is authenticated
  before_action :authenticate_person!

  # GET /people or /people.json
  def index
    @people = Person.all
    authorize :person, :index?
  end

  # GET /people/1 or /people/1.json
  def show
    @grades = @person.grades
    authorize @person, :show?
  end

  # GET /people/new
  def new
    @person = Person.new
    authorize @person, :new?
  end

  # GET /people/1/edit
  def edit
    authorize @person, :edit?
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    authorize @person, :create?

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_url, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    authorize @person, :update?
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_url, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy!
    authorize @person, :destroy?

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:gender, :first_name, :last_name, :birth_date, :address, :phone_number, :email, :password, :locality_id, :role_id, :exam_ids)
    end
end
