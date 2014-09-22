class Role < ActiveRecord::Base
  has_many :users, through: :roles_users
end
