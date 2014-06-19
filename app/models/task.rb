class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  validates :name, :date, presence: true
 
  has_many :guests, class_name: "TaskUser", dependent: :destroy
  scope :ujoin,->{includes(:user, :guests, :place)}
  scope :ordering,->{order("user_id asc, date asc, priority desc")}


  def definition_class(u)
    return "danger" if u - Time.now <= 1.day
    return "warning" if u - Time.now >  3.day
    return "success"
  end

end
