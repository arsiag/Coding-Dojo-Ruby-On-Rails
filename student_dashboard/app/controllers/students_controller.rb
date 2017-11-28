class StudentsController < ApplicationController
  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:success] = ["You have successfully created a Student!"]
      redirect_to "/dojos/#{@student.dojo_id}"
    else
      flash[:errors] = @student.errors.full_messages
      # redirect_to :back
      redirect_to "/dojos/#{@student.dojo_id}/students/new"
    end
  end

  def show
    # created custome class method to join the student and the dojo. Look at the Student model
    @student = Student.with_dojo(params[:id])
    # created custom class method. Look at the Student model
    @cohort = Student.cohort(@student)
  end

  def edit
    @dojos = Dojo.all
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:success] = ["You have successfully updated a Student!"]
      redirect_to "/dojos/#{@student.dojo_id}/students/#{@student.id}"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to "/dojos/#{@student.dojo_id}/students/#{@student.id}/edit"
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to "/dojos/#{params[:dojo_id]}"
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end
