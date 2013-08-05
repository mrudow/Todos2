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
    if @todo.save
      Todo.all.each do |todo|
        if todo.id != @todo.id
          todo.position +=1
          todo.save
        end
      end
      Todo.dropdown_order << (1 + Todo.dropdown_order.length)
    end
    redirect_to @todo
  end



  I need to make my switch position command for changing position by clicking and editing. here are some ideas
if the hole is above the current position, then it is < @todo.position. If the hole is below the current position, the hole is > @todo.postion

  def switch_position
    a=[]
    Todo.all.each do |todo|
      a << todo.position
    end
    b=0
    for i in 0..Todo.dropdown_order.length
      if a.include?(Todo.dropdown_order(i))
        1==1
      else
        b=Todo.dropdown_order(i)
      end
    end
    if @todo.position > i
      Todo.all.each do |todo|
        if (i < todo.position <= @todo.position) && (todo.id != @todo.id)
          todo.position -=1
        end
      end
    else
      Todo.all.each do |todo|
        if (i > todo.position >= @todo.position) && (todo.id != @todo.id)
          todo.position +=1
        end
    end
    end

  def switch_position_up
    Todo.all.each do |todo|
      if (todo.position <= @todo.position) && (todo.id != @todo.id)
        todo.position +=1
      end
    end
  end

  def switch_position_down
    Todo.all.each do |todo|
      if (todo.position >= @todo.position) && (todo.id != @todo.id)
        todo.position -=1
      end
    end
  end






  def update
    @todo = Todo.find(params[:id])
    
    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to(@todo, :notice => 'Todo was successfully updated.') }
        format.json { respond_with_bip(@todo) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@todo) }
      end
    end
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
    Todo.dropdown_order.delete(Todo.dropdown_order.length)
    if @todo.save
      Todo.all.each do |todo|
        if todo.position >= @todo.position
          todo.position -=1
          todo.save
        end
      end
    end
  end 

  #def sort
   # params[:todos].each_with_index do |id, index|
    #  Todo.update_all(['position=?', index+1], ['id=?', id])
    #end
    #render :nothing => true
  #end

end  
  # this was under index and was connected with def todos params@todos=Todo.new(todos_params)

  #private
   # def todos_params
    #  params.require(:content, :user_id)
    #end
