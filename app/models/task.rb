class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :guests, class_name: "TaskUser", dependent: :destroy
  scope :ujoin,->{joins(:user)}
  scope :ordering,->{order("user_id asc, date asc, priority desc")}
end
