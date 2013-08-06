class Todo < ActiveRecord::Base
  attr_accessible :boolean, :completed, :content, :position, :notes, :user_id
  USER_ID={1=>"Hunter", 2=>"Andy", 3=>"Michael"}
  validates :content, :presence => true
  validates :user_id, :numericality=> { :message=> "must be selected from the drop-down list"}
  @@dropdown_order=[]
  def self.dropdown_order
    @@dropdown_order
  end
  
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
end
