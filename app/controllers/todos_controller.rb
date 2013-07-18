class TodosController < ApplicationController
  def index
    @todos= Todo.all
    @todos=Todo.new(todos_params)
    @todos.save

    @todos = Todo.find(params[:id])
  end 

  def new
  end


  def show

  end

  def create
    
  end

  private
    def todos_params
      params.require(:content, :user_id)
    end
end
