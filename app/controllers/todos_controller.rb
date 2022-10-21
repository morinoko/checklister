class TodosController < ApplicationController
  before_action :set_todo, only: %w[show edit update destroy]

  def index
    @todos = current_share_group.todos.ordered
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_share_group.todos.build(todo_params)

    if @todo.save
      message = "New todo added!"

      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = message }
        format.html { redirect_to todos_path, notice: message }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      message = "Todo successfully updated."

      respond_to do |format|
        format.html { redirect_to todos_path, notice: message }
        format.turbo_stream { flash.now[:notice] = message }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy

    message = "Todo successfully deleted."
    respond_to do |format|
      format.html { redirect_to todos_path, notice: message }
      format.turbo_stream { flash.now[:notice] = message }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:summary)
  end

  def set_todo
    @todo = current_share_group.todos.find(params[:id])
  end
end
