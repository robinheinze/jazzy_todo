class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render :json => @todos
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render :json => @todo, :status => 201
    else
      render :json => {:errors => @todo.errors}, :status => 422
    end
  end

  def show
    @todo = Todo.find(params[:id])
    render :json => @todo
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      head :no_content
    else
      render :json => {:errors => @todo.errors}, :status => 422
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    head :no_content
  end

private

  def todo_params
    params.fetch(:todo).permit(:title, :is_completed)
  end
end