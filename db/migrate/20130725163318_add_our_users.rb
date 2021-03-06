class AddOurUsers < ActiveRecord::Migration
  def up
    user_names=["Hunter", "Andy", "Michael"]
    user_names.each_with_index do |u, i|
      u = User.new
      u.username = user_names[i]
      u.save
    end
  end

  def down
    user_names=["Hunter", "Andy", "Michael"]
    user_names.each_with_index do |u, i|
      u = User.find_by_username(user_names[i])
      u.delete
    end
  end
end
