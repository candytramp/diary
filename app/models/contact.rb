class Contact < ActiveRecord::Base
	has_many :contact_lists, :as=> :friend, dependent: :destroy
	has_many :task_users, :as=> :group, dependent: :destroy
	
	def full_name
     self.first_name + " " +self.second_name + " "  +self.last_name 
   end
end
