class TodosController < ApplicationController
  def index
    @todos= Todo.all(:order =>"position")
    @todo=Todo.new(params[:todo])
    #if @todo.save
      #true
    #else
      #print "Error Occured"
    #end
    
    #@todos = Todo.find(params[:id])
  end 
  
  def new
    @todo = Todo.new
  end

  def show
  end 
  
  def create 
    @todos= Todo.all(:order =>"position")
    @todo = Todo.new(params[:todo])
    @todo.position = 1
    if @todo.save
      Todo.all.each do |todo|
        if todo.id != @todo.id
          todo.position +=1
          todo.save
        end
      end
      redirect_to todos_path
    else
      if @todo.user_id==(1|2|3)
        flash.now[:notice]= "Content can't be blank"
      elsif @todo.content.length > 0
        flash.now[:notice]= "User must be selected from the drop-down list"
      else
        flash.now[:notice]= "Content can't be blank and User must be selected from the drop-down list"
      end
      #flash.now[:notice]="error"
      render :action => "index"
    end
    #redirect_to @todo
  end

  
  def update
    @todo = Todo.find(params[:id])
    old_pos=@todo.position
    old_checkbox=@todo.completed
    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to(@todo, :notice => 'Todo was successfully updated.') }
        format.json { respond_with_bip(@todo) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@todo) }
      end
    end
    if @todo.completed==old_checkbox
      1==1
    else
      change_for_checkbox(@todo)
    end
    if @todo.position < 1
      switch_position(@todo, old_pos)
      @todo.position=1
      @todo.save
    elsif @todo.position > last_position
      switch_position(@todo, old_pos)
      @todo.position=last_position
      @todo.save
    else
      switch_position(@todo, old_pos)
    end
  end
  
    
  #DELETE /todos/1
  #DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html {redirect_to :back}
      format.json {head :no_content}
    end
    if @todo.save
      Todo.all.each do |todo|
        if todo.position > @todo.position
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
