class Contact < ActiveRecord::Base
	has_many :contact_lists, :as=> :friend, dependent: :destroy
	has_many :task_users, :as=> :group, dependent: :destroy
	validates :first_name, :last_name, presence: true
	validates :email, :phone, uniqueness: true, presence: true
	
	def full_name
     self.first_name + " " +self.second_name + " "  +self.last_name 
   end
end
