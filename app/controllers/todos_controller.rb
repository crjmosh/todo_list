class TodosController < ApplicationController
  def index
  	@todos = Todo.order("priority DESC, updated_at DESC").all
  	if Todo.count > 0
  		@percent = ((Todo.where(complete: true).count.to_f / Todo.count.to_f) * 100).to_i
  	else
  		@percent = 0
  	end
  end

  def show
  	@todo = Todo.find(params[:id])
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(todo_params)
  	if @todo.save
  		redirect_to todos_path
  	else
  		render :new
  	end
  end

  def edit
  	@todo = Todo.find(params[:id])
  end

  def update
  	@todo = Todo.find(params[:id])
  	if @todo.update(todo_params)
  		redirect_to todos_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@todo = Todo.find(params[:id])
  	@todo.destroy
  	redirect_to todos_path
  end

  private
  	def todo_params
  		params.require(:todo).permit(:item, :complete, :details, :priority)
  	end
end
