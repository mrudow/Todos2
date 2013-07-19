class Todo < ActiveRecord::Base
  attr_accessible :boolean, :completed, :content, :position, :user_id
  USER_ID={0=>"Hunter", 1=>"Andy", 2=>"Michael"}
  validates :content, :presence => true
  validates :user_id, :numericality=> { :message=> "must be selected from the drop-down list"}
end
