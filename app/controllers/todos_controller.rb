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
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to todos_path, notice: "New todo added!" }
      end
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

    respond_to do |format|
      format.html { redirect_to todos_path, notice: "Todo successfully deleted." }
      format.turbo_stream
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:summary)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
