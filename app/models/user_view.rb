class UserView < ActiveRecord::Base
  belongs_to :user
  belongs_to :tip
end
