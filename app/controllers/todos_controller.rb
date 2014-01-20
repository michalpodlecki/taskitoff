class TodosController < ApplicationController
  def index
  	@todos = Todo.all
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
    @todo = Todo.new(params[:id])
    if @todo.save
      redirect_to todos_path, notice: "Todo was saved successfully. Now get to work!"
    else
      flash[:error] = "Sorry bud, but there was an error. Please try again"
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
   if @topic.destroy
      flash[:notice] = "\"#{description}\"[0..6] was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
end