class TodosController < ApplicationController
  def index
    @todos= Todo.all(:order =>"position")
    @todo=Todo.new
    @todo.save
    
    #@todos = Todo.find(params[:id])
  end 

  def new
  end


  def show

  end

  def create
    @task = Task.new(params[:task])
    @task.position = 1

  end
  
  
  # this was under index and was connected with def todos params@todos=Todo.new(todos_params)

  #private
   # def todos_params
    #  params.require(:content, :user_id)
    #end
end
