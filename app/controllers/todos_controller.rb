class TodosController < ApplicationController
  def index
    @todos= Todo.all(:order =>"position")
    @todo=Todo.new(params[:todo])
    if @todo.save
      true
    else
      print "Error Occured"
    end
    
    #@todos = Todo.find(params[:id])
  end 

  def new
    @todo = Todo.new
  end


  def show

  end

  def create
    @todo = Todo.new(params[:todo])
    @todo.position = 1
    @todo.save
    redirect_to @todo
    
  end

  def update
    @todo = Todo.find(params[:id])
  end

  
  #DELETE /todos/1
  #DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html {redirect_to todos_url}
      format.json {head :no_content}
    end
  end 
end  
  # this was under index and was connected with def todos params@todos=Todo.new(todos_params)

  #private
   # def todos_params
    #  params.require(:content, :user_id)
    #end
