class Contact < ActiveRecord::Base
	has_many :contact_lists, :as=> :friend, dependent: :destroy
	has_many :task_users, :as=> :group, dependent: :destroy
end
