class Remark < ActiveRecord::Base
  belongs_to :user
  validates :topic, presence: true, length:{maximum:50}, uniqueness: true
end
