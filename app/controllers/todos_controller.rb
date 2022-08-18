class TodosController < ApplicationController
  before_action :set_todo, only: %w[show edit update destroy]

  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path, notice: "New todo added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "Todo successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "Todo successfully deleted."
  end

  private

  def todo_params
    params.require(:todo).permit(:summary)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
