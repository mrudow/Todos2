class Todo < ActiveRecord::Base
  attr_accessible :boolean, :completed, :content, :position, :notes, :user_id
  USER_ID={1=>"Hunter", 2=>"Andy", 3=>"Michael"}
  validates :content, :presence => true
  validates :user_id, :numericality=> { :message=> "must be selected from the drop-down list"}
  @@dropdown_order=[]
  def self.dropdown_order
    @@dropdown_order
  end
  def switch_position
    a=[]
    Todo.all.each do |todo|
      a << todo.position
    end
    b=0
    for i in 1..Todo.dropdown_order.length
      if a.include?(Todo.dropdown_order(i))
        1==1
      else
        b=Todo.dropdown_order(i)
      end
    end
    self.content=self.position
    if (self.position > b) && (b!=0)
      Todo.all.each do |todo|
        if (b < todo.position) && (todo.position <= self.position) && (todo.id != self.id)
          todo.position -=1
        end
      end
    elsif (self.position < b) && (b!=0)
      Todo.all.each do |todo|
        if (b > todo.position) && (todo.position >= self.position) && (todo.id != self.id)
          todo.position +=1
        end
      end
    elsif self.position > Todo.dropdown_order.length
      self.position = b
    elsif b=0
      1==1
    end
  end

  belongs_to :user
end
