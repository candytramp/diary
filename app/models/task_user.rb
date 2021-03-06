class TaskUser < ActiveRecord::Base
  belongs_to :task
  belongs_to :group, polymorphic: true
  validates :group_id, uniqueness: { scope: [:task_id, :group_type] }
end
