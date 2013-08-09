class Todo < ActiveRecord::Base
  attr_accessible :completed, :content, :position, :notes, :user_id
  USER_ID={1=>"Hunter", 2=>"Andy", 3=>"Michael"}
  validates :content, :presence => true
  validates :user_id, :numericality=> { :message=> "must be selected from the drop-down list"}
  belongs_to :user
end

def switch_position(instance, old_pos)
  if instance.position == old_pos
    1==1  
  elsif (instance.position > old_pos)
    Todo.all.each do |todo|
      if (old_pos < todo.position) && (todo.position <= instance.position) && (todo.id != instance.id)
        todo.position -=1
        todo.save
      end
    end
  elsif (instance.position < old_pos)
    Todo.all.each do |todo|
      if (old_pos > todo.position) && (todo.position >= instance.position) && (todo.id != instance.id)
        todo.position +=1
        todo.save
      end
    end
  end
  if instance.completed == true
    Todo.all.each do |todo|
      if todo.position==instance.position+1
        if todo.completed!=true
          instance.completed=false
          instance.save
        end
        break
      end
    end
  elsif instance.completed != true
    Todo.all.each do |todo|
      if todo.position==instance.position-1
        if todo.completed==true
          instance.completed=true
          instance.save
        end 
        break
      end
    end
  end
end

def last_position
  last_position=0
  Todo.all.each do |todo|
    if 1==1
      last_position +=1
    end
  end
  return last_position
end

def change_for_checkbox(instance)
  pos=1
  Todo.all.each do |todo|
    if (todo.completed!=true) && (todo.id !=instance.id)
      pos +=1
    end
  end
  old_position=instance.position
  instance.position=pos
  instance.save
end 
