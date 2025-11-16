class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[ show edit update destroy ]
  before_action :set_student, only: %i[edit update destroy ]

  # GET /assignments or /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1 or /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @student = Student.find(params[:student_id])
    @assignment = @student.assignments.new
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
    @student = @assignment.student
  end

  # POST /assignments or /assignments.json
  def create
    @student = Student.find(params[:student_id])
    @assignment = @student.assignments.new(assignment_params)

    if @assignment.save
      redirect_to @student, notice: "Assignment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    @student = @assignment.student  # ensure @student is available

    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html do 
          redirect_to student_path(@student),
          notice: "Assignment was successfully updated.",
          status: :see_other
        end
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy!

    respond_to do |format|
      format.html { redirect_to student_path(@student), notice: "Assignment was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def toggle_complete
    @assignment = Assignment.find(params[:id])
    @student = @assignment.student
    @assignment.update(completed: !@assignment.completed)

    redirect_to student_path(@student), notice: "Assignment updated."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def set_student
    @student = @assignment.student
    end


    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:title, :description, :due_date, :completed)
    end

end
