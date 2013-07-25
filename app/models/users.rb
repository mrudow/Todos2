class Users < ActiveRecord::Base
  attr_accessible :username
  has_many :todos
  #def initialize(username)
    #@username = username
  #end
end
