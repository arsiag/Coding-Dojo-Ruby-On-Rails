class DojosController < ApplicationController
  def index
    @count = Dojo.count
    @dojos = Dojo.all
  end

  def new
    @dojo = Dojo.new
  end 

  def create
    @dojo = Dojo.new(dojo_params)
    
    if @dojo.save
      flash[:success] = ["You have successfully created a new Dojo!"]
      redirect_to "/dojos"
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to "/dojos/new"
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
    @students = @dojo.students
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])

    if @dojo.update(dojo_params)
      flash[:success] = ["You have successfully updated a Dojo!"]
      redirect_to "/dojos"
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to "/dojos/#{@dojo.id}/edit"
    end
  end

  def destroy
    Dojo.find(params[:id]).destroy
    redirect_to "/dojos"
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end

end
