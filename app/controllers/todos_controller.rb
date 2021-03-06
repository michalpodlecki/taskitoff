class TodosController < ApplicationController
   respond_to :html, :js

  def index
  	@todos = current_user.todos
  end

  def show
  	@todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(params[:todo])
    @todo.user = current_user
    @todo.completed = false
    if @todo.save
      redirect_to todos_path, notice: "Todo was saved successfully. Now get to work!"
    else
      flash[:error] = "Sorry bud, but there was an error. Please try again"
      render :new
    end

    #respond_with(@todo) do |f|
     # f.html 
    #end

  end

  def destroy
    @todo = Todo.find(params[:id])
    name = @todo.name

    if @todo.destroy
      flash[:notice] = "\"#{name}\" was removed successfully."
      redirect_to todos_path
    else
      flash[:error] = "There was an error removing the topic."
      redirect_to todos_path
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(params[:todo])
      redirect_to todos_path
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end    
  end

  def completed
    @todo = Todo.find(params[:id])
    @todo.update_attribute(:completed, true)
  end

end
