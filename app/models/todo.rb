class Todo < ActiveRecord::Base
  attr_accessible :boolean, :completed, :content, :position, :user_id
  USER_ID={0=>"Hunter", 1=>"Andy", 2=>"Michael"}
  validates :content, :presence => true
  validates :user_id, :numericality=> { :message=> "must be selected from the drop-down list"}
  make_order=Hash.new
  i=0
  for i < Todo.all.count
    hash[i]=i+1
    i +=1
  end
end
